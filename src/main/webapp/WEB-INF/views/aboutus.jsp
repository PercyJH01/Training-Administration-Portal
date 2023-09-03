<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="aboutus.css">
    <title>Preview About</title>
    <style>
        *{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
    
}
.wrapper{
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
}
.background-container{
    width: 100%;
    min-height: 100vh;
    display: flex; 
    background-color: rgba(0, 0, 0, 0.9);
}
/* .bg-1{
    flex: 1;
    background-color: rgb(180, 243, 175);
}
.bg-2{
    flex: 1;
    background-color: rgb(163, 236, 240);
} */
.about-container{
    width: 85%;
    min-height: 80vh;
    position: absolute;
    background-color: white;
    /* box-shadow: 10px 10px 10px 10px  #6d8dad; */
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px 40px;
    border-radius: 5px;
}
.image-container{
background-image: url("<c:url value="/resources/images/about1.jpg" />") no-repeat;
    display: flex;
    justify-content: center;
    align-items: center;
}
.image-container img {
    width: auto;
    height: auto;
    margin: 20px;
    border-radius: 10px;
}
.text-container{
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
    font-size: 22px;
}
.text-container h1{
    font-size: 70px;
    padding: 20px 0px;
}
.text-container a{
    text-decoration: none;
    padding: 12px;
    margin: 50px 0px;
    background-color: rebeccapurple;
    border: 2px solid transparent;
    color: white;
    border-radius: 5px;
    transition: .3s all ease;
}
.text-container a:hover{
    background-color: transparent;
    color: black;
    border: 2px solid rebeccapurple;
}
@media screen and (max-width: 1600px){
    .about-container{
        width: 90%;
    }
    .image-container img{
        width: 400px;
        height: 400px;
    }
    .text-container h1{
        font-size: 50px;
    }
}
@media screen and (max-width: 1100px){
    .about-container{
        flex-direction: column;
    }
    .image-container img{
        width: 300px;
        height: 300px;
    }
    .text-container {
        align-items: center;
    }
}
    </style>
</head>
<body>
    <div class="wrapper">

        <div class="background-container">
            <div class="bg-1"></div>
            <div class="bg-2"></div>
    
        </div>
        <div class="about-container">
            
            <div class="image-container">
                <img src=<c:url value="/resources/images/about1.jpg" /> >
                
            </div>

            <div class="text-container">
                <h1>About us</h1>
                <p>we are dedicated to empowering individuals and organizations with the skills and knowledge they need to succeed in today's rapidly evolving world. Our platform is designed to be a comprehensive and accessible hub for learning, offering a wide range of high-quality training courses and resources that cater to various fields and industries.</p>
                
            </div>
            
        </div>
    </div>
    

</body>
</html>