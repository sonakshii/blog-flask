from flask import Flask, render_template, request,session,redirect,flash
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from flask_mail import Mail
import json
import os
import math
from datetime import datetime

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

local_server = True
app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER']=params['upload_location']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD=  params['gmail-password']
)
mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)

class Contacts(db.Model):
    SRNO = db.Column(db.Integer, primary_key=True)
    NAME = db.Column(db.String(80), nullable=False)
    EMAIL = db.Column(db.String(120), nullable=False)
    PHONE = db.Column(db.String(12), nullable=False)
    MESSAGE = db.Column(db.String(120), nullable=False)
    DATE = db.Column(db.String(12), nullable=True)

class Posts(db.Model):
    Sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    subheading = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)

@app.route("/")
def home():
    flash("WELCOME TO THE BLOG","success")
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page=1
    page=int(page)
    posts=posts[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
    if (page==1):
        prev = ""
        next = "/?page=" + str(page+1)
    elif(page==last):
        next = ""
        prev = "/?page=" + str(page - 1)
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', params=params,posts=posts,prev=prev,next=next)

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:Sno>", methods=['GET','POST'])
def delete(Sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post=Posts.query.filter_by(Sno=Sno).first()
        db.session.delete(post)
        db.session.commit()
    return render_template('dashboard.html', params=params, post=post)

@app.route("/uploader", methods = ['GET','POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method=='POST'):
            f= request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'],secure_filename(f.filename)))
            return "uploaded succesfully"

@app.route("/dashboard", methods = ['GET','POST'])
def dashboard():
    if ('user' in session and session['user'] == params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)
    if request.method =='POST':
        username=request.form.get('uname')
        userpass=request.form.get('pass')
        if (username==params['admin_user'] and userpass==params['admin_password']):
            session['user']=username
            posts= Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)

    return render_template('login.html', params=params)

@app.route("/edit/<string:Sno>", methods=['GET','POST'])
def edit(Sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method=='POST':
            box_title= request.form.get('title')
            tagline= request.form.get('tagline')
            slug= request.form.get('slug')
            content= request.form.get('content')
            img_file= request.form.get('img_file')
            date = datetime.now()
            if Sno=='0':
                post = Posts(title=box_title,slug=slug,subheading=tagline,content=content,img_file=img_file,date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post=Posts.query.filter_by(Sno=Sno).first()
                post.title =box_title
                post.slug =slug
                post.subheading =tagline
                post.content=content
                post.img_file =img_file
                post.date= date
                db.session.commit()
                return redirect('/edit/'+Sno)
        post=Posts.query.filter_by(Sno=Sno).first()
        return render_template('edit.html',params=params,post=post,Sno=Sno)

@app.route("/about")
def about():
    return render_template('about.html', params=params)

@app.route('/contact', methods = ['GET','POST'])
def contact():
    if(request.method == 'POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry= Contacts(NAME=name,EMAIL=email,PHONE=phone,MESSAGE=message,DATE=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from' + name,
                          sender=email,
                          recipients=[params['gmail-user']],
                          body=message + "\n" + phone
                            )
        flash("Your response has been submitted.Thank You.","success")
    return render_template('contact.HTML',params=params)

app.run(debug=True)
