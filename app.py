from email import message
import os
from werkzeug.utils import secure_filename
from flask import Flask, render_template, request, session,redirect
from flask_sqlalchemy import SQLAlchemy
# from flask_mail import Mail,Message
import smtplib as s
from datetime import datetime
import json
import math


from werkzeug.utils import redirect, secure_filename

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app = Flask(__name__, template_folder='tamplates')
app.secret_key = 'tushant'
ob=s.SMTP("smtp.gmail.com",587)


ob.starttls()
ob.login(params["gmail-user"],params["gmail-password"])

# app.config.update(
#     MAIL_SERVAR = 'smtp.gmail.com',
#     MAIL_PORT=465,
#     # server = smtplib.SMTP('smtp.gmail.com:587')
#     MAIL_USE_TLS = False,
#     Mail_USE_SSL = True,
#     MAIL_USERNAME = params["gmail-user"],
#     Mail_PASSWORD=params["gmail-password"]


# )
# mail = Mail(app)

app.config['SQLALCHEMY_DATABASE_URI'] = params["sqlalchemy_config"]
app.config['UPLOAD'] = params["upload_location"]
db = SQLAlchemy(app)


class Contacts(db.Model):
    '''sno, name,phone_no,msg,date,email'''
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_no = db.Column(db.String(20), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    email = db.Column(db.String(20), nullable=False)


class Posts(db.Model):
    '''sno, name,phone_no,msg,date,email'''
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(22), nullable=False)
    cantent = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    tagline = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)
    


@app.route("/")
def index():
    postno = params["no_of_posts"]
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(postno))

    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page=1
    page= int(page)
    posts = posts[(page-1)*int(postno): (page-1)*int(postno)+int(postno)]
    if (page==1):
        prev = "#"
        next = "/?page=" +str(page+1)
    elif(page==last):
        prev = "/?page=" +str(page-1)
        next = "#"
    else:
        prev = "/?page=" +str(page-1)
        next = "/?page=" +str(page+1)
    


    
    return render_template('index.html',posts=posts, params=params,prev=prev,next=next)


@app.route("/index")
def home():
    postno = params["no_of_posts"]
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/int(postno))

    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page=1
    page= int(page)
    posts = posts[(page-1)*int(postno): (page-1)*int(postno)+int(postno)]
    if (page==1):
        prev = "#"
        next = "/?page=" +str(page+1)
    elif(page==last):
        prev = "/?page=" +str(page-1)
        next = "#"
    else:
        prev = "/?page=" +str(page-1)
        next = "/?page=" +str(page+1)
    


    # posts = Posts.query.filter_by().all()
    return render_template('index.html',posts=posts, params=params,prev=prev,next=next)


@app.route("/about")
def about():
    return render_template('about.html', params=params)

@app.route("/signin", methods =['GET','POST'] )
def signin():
    if ('user' in session and session['user'] == params['admin_user']):
   
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)
    
    if request.method=='POST':
        username = request.form.get('uname')
        password = request.form.get('pass')
        if (username == params['admin_user'] and password == params['admin_pass']):
            session['user'] = username

            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
        else:
           return render_template('sigin.html', params=params)
    else:
      return render_template('sigin.html', params=params)




@app.route("/edit/<string:sno>",methods=['GET','POST'])
def update(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method =='POST':
            title=request.form.get('title')
            cantent=request.form.get('cantent')
            slug=request.form.get('slug')
            img_file=request.form.get('img_file')
            tagline=request.form.get('tagline')
            date=datetime.now()
            if sno=='0':
               post = Posts(title=title, cantent=cantent,tagline=tagline, date=date,slug=slug,  img_file=img_file)
               db.session.add(post)
               db.session.commit()
               return render_template('edit.html',sno=sno, params=params,post=post)
               
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = title
                post.cantent = cantent
                post.slug = slug
                post.tagline = tagline
                post.img_file =  img_file
                post.date =date
                ssno= str(sno)
                db.session.commit()
            return redirect("/edit/" + ssno)


        
        post = Posts.query.filter_by(sno=sno).first()    
        return render_template('edit.html',sno=sno, params=params,post=post)
        

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()

    return render_template('post.html', params=params, post=post)



@app.route("/post")
def abouts():
    
    return render_template('post.html',params=params)





@app.route("/uploader", methods=['GET', 'POST'])
def uploader():
    if ('user' in session and session['user']== params['admin_user']):
       if (request.method == "POST"):
            f=request.files['file']
            f.save(os.path.join(app.config['UPLOAD'], secure_filename(f.filename)))
            return "upload successfully"
    return "upload unsuccessfully"


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/signin')

@app.route("/delete/<string:sno>", methods = ['GEt','POST'])
def delete(sno):
    if ('user' in session and session['user']== params['admin_user']):
        post = Posts.query.filter_by( sno = sno).first()
        db.session.delete(post)
        db.session.commit()

        return redirect('/signin')




@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if (request.method == 'POST'):
        name = request.form.get('name')
        phone = request.form.get('phone')
        email = request.form.get('email')
        message = request.form.get('message')
        '''sno, name,phone_no,msg,date,email'''
        entry = Contacts(name=name, phone_no=phone, msg=message,
                         date=datetime.now(),  email=email)
        db.session.add(entry)
        db.session.commit()
        ''' send message on gmail when contect form are submit 
            using smtplib
        '''
        subject = "message on blog"
        body = f"Name: {name}\n phone no: {phone}\n email: {email}\n\nMessage:\n{message}"
        messagetsend = f"subject:{subject}\n\n{body}"
     

        listOfAddress = ["tushantparjapat@gmail.com"]
        ob.sendmail("tushantkk55@gmail.com", listOfAddress, messagetsend)
        

        ob.quit()

    return render_template('contact.html',params=params)

  

app.run(debug=True)
