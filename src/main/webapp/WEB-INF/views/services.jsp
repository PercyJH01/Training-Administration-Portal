<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <title>Services demo</title>
    <style>
        *{
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
    
    
    
}

.main-wrapper{
    width: 100%;
    min-height: 100vh;
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    background-color: rgba(0, 0, 0, 0.5);
    
}
.bg-1{
    width: 100%;
    min-height: 30vh;
    background-color: rgb(92, 92, 224);
    position: absolute;
    top: 0;
}
.bg-2{
    width: 100%;
    min-height: 70vh;
    
}
.cards-container{
    position: absolute;
    display: grid;
    grid-template-columns: repeat(3 ,auto);
    justify-content: center;
    align-items: center;
    grid-gap: 20px;
    padding: 30px;
    
}
.top-heading{
    position: absolute;
    top: 20px;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    
}
.top-heading h1{
    font-size: 60px;
    font-weight: 900;
}
.top-heading p{
    font-size: 30px;
}
.cards{
	width:350px;
    display: flex;
    justify-content: center;
    align-items:center ;
    flex-direction: column;
    background-color: white;
    padding: 30px 20px;
    margin: 20px;
    border-radius: 10px;
    box-shadow: 15px 15px 15px rgba(0, 0, 0, 0.178);  
    transition: .1s all ease; 
}
.cards:hover{
    box-shadow: 35px 35px 35px rgba(0, 0, 0, 0.178);
}
.las{
    font-size: 60px;
    border-radius: 50%;
    padding: 10px;
    background-color: rgb(92, 92, 224);
    border: 2px solid transparent;
    color: white;
}
.heading{
    font-size: 30px;
    padding: 5px 0px;
    
}
.text{
    font-size: 20px;
}
@media screen and (max-width: 1400px) {
    .cards-container{
        
        grid-template-columns: repeat(2 ,auto);
        grid-gap: 0px;
        padding: 30px;
        top: 100px;
    }
}
@media screen and (max-width: 748px) {
    .cards{
        padding: 20px;
    }
    .cards-container{
        grid-template-columns: repeat(1 ,auto);
    }
    .cards .heading{
        font-size: 23px;
        font-weight: 900;
    }
}

    </style>
</head>
<body>
   
        <div class="main-wrapper">
            <div class="bg-1"></div>
            <div class="bg-2"></div>
            
            <div class="top-heading">
                <h1>Services</h1>
            </div>
        
            <div class="cards-container">
                
                <div class="cards">
                    <div class="icon"><i class="las la-code"></i></div>
                    <div class="heading">Frontend</div>
                    <div class="text"></div>
                </div>
                <div class="cards">
                    <div class="icon"><i class="las la-server"></i></div>
                    <div class="heading">Backend</div>
                    <div class="text"></div>
                </div>
                <div class="cards">
                    <div class="icon"><i class="las la-palette"></i></div>
                    <div class="heading">UI Design</div>
                    <div class="text"></div>
                </div>
                <div class="cards">
                    <div class="icon"><i class="las la-mobile"></i></div>
                    <div class="heading">App development</div>
                    <div class="text"> </div>
                </div>
                <div class="cards">
                    <div class="icon"><i class="las la-envelope"></i></div>
                    <div class="heading">Email marketing</div>
                    <div class="text"></div>
                </div>
                <div class="cards">
                    <div class="icon"><i class="las la-desktop"></i></div>
                    <div class="heading">Website</div>
                    <div class="text"></div>
                </div>
                
            </div>  
            
        </div>
    
</body>
</html>
        