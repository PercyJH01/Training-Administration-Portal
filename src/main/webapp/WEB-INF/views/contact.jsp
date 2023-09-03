<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="contactus.css">
    <title>Contact</title>
    <style>
        *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Comfortaa', cursive;
}
.contact-wrapper{
    display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-direction: column;
    width: 100%;
    min-height: 100vh;
    background-color: rgba(0, 0, 0, 0.5);
}
.heading{
    padding: 30px 0px;
    font-size: 35px;
}
.contact-box{
    display: flex;
    width: 90%;
    min-height: 80vh;
    background-color: rgb(238, 238, 238);
    padding: 20px;
    /* box-shadow: 15px 15px 15px rgb(211, 208, 208); */
    border-radius: 10px;
}
.left-contact{
    background-color: #1454b4;
    flex: 1;
    position: relative;
    overflow: hidden;
    color: white;
    padding: 50px;
    border-radius: 10px;
}
.left-contact h1{
    font-size: 50px;
    padding: 10px 0px;
}
.left-contact p{
    font-size: 20px;
    padding: 20px 0px;
}
.left-icon{
    padding: 20px 0px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
}
.left-icon h3{
    z-index: 10;
   font-size: 30px;
}
.las{
    padding: 0px 10px;
    font-size: 50px;
}
.small-circle{
    background-color: #a51e78;
    width: 200px;
    height: 200px;
    border-radius: 50%;
    position: absolute;
    bottom: 100px;
    right: 100px;
    z-index: 5;
}
.big-circle{
    background-color: #eb77c4;
    width: 450px;
    height: 450px;
    border-radius: 50%;
    position: absolute;
    bottom: 0;
    right: 0;
    transform: translate(200px, 200px);
}
.right-contact,.form-container{
    flex: 2;
    display: flex;
    justify-content: center;
    align-items: center;
}
.input{
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
}
form{
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
    margin: 20px;
}
input,textarea{
    width: 450px;
    border: none;
    border-bottom: 2px solid transparent;
    background-color: rgb(190, 187, 187);
    padding: 10px;
    border-radius: 5px;
    font-size: 20px;
    margin: 10px;
    resize: none;
}
label{
    font-size: 22px;
    padding: 10px 0px;
}
select{
    width: 450px;
    border-radius: 5px;
    padding: 10px;
    background-color: rgb(190, 187, 187);
    border: 2px solid transparent;
    font-size: 18px;
    margin: 10px;

 }
button{
    padding: 15px 40px;
    border: none;
    background-color:  #eb77c4;
    font-size: 20px;
    margin: 30px 10px;
    border-radius: 5px;
    color: white;
    transition: .5s all ease-in-out;
    border: 2px solid transparent;
}
button:hover{
    background-color: transparent;
    border: 2px solid #eb77c4;
    color: black
    ;
}
.social-icons{
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
}
.lab{
    padding: 20px 100px;
    font-size: 50px;
    color: rebeccapurple;
}

@media screen and (max-width:1600px ) {
    .left-contact h1{
        font-size: 30px;
    }
    .left-contact p{
        font-size: 20px;
    }
    .left-icon h3{
        font-size: 20px;
    }
}
@media screen and (max-width:1350px ) {
    .lab{
        padding: 20px 20px;
    }
}
@media screen and (max-width:1200px ) {
   .contact-box{
       width: 95%;
   }
}
@media screen and (max-width:1100px ) {
    .small-circle{
       
        bottom: 20px;
        right: 20px;
        z-index: 5;
    }
    .big-circle{
       
        transform: translate(300px, 300px);
    }
    .left-contact{
        padding: 20px;
    }
    .left-contact h1{
        font-size: 22px;
    }
    .left-contact p{
        font-size: 18px;
    }
    .left-icon h3{
        font-size: 18px;
    }
    .las{
        font-size: 30px;
    }
    input,textarea{
        width: 350px;
    }
}
@media screen and (max-width:950px ) {
    .contact-box{
        flex-direction: column;
    } 
}
@media screen and (max-width:520px ) {
    .form-container{
        flex-direction: column;
    }
    .social-icons{
        flex-direction: row;
    }  
}
@media screen and (max-width:420px ) {
    input,textarea{
        width: 300px;
    } 
}
    </style>
</head>
<body>
    <section class="contact-wrapper">
        <div class="heading">
            <h1>Contact us</h1>
        </div>
        <div class="contact-box">
            <div class="left-contact">
                <h1>Contact Information</h1>
                <p>Any Question and feedback? just write us a message</p>
                <div class="phone  left-icon">
                    <i class="las la-phone"></i>
                    <h3>+91 516 165 5624</h3>
                </div>

                <div class="mail left-icon">
                    <i class="las la-envelope"></i>
                    <h3>codedroplet@gmail.com</h3>
                </div>

                <div class="location left-icon">
                    <i class="las la-map-marker-alt"></i>
                    <h3>Delhi, India</h3>
                </div>
                <div class="small-circle"></div>
                <div class="big-circle"></div>

            </div>
            

      
    </section>
    
</body>
</html>