<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
    * {
        margin: 0;
        padding: 0;
        font-size: 18px;
        box-sizing: border-box;
    }

    h3 {
        text-align: center;
        font-size: 24px;
        margin: 4%;
    }

    h3 a {
        font-size: 26px;
        color: #3b5998;
        text-decoration: none;
    }

    h3 a:hover {
        color: #0099FF;
    }

    .header {
        background-color: rgba(0, 0, 0, 0.8);
    }

    .logo {
        width: 55%;
        height: 80px;
        float: left;
        background-color: rgba(0, 0, 0, 0.8);
        border-bottom: 3px solid rgb(0, 250, 200);
    }

    .logo p {
        font-size: 40px;
        color: white;
        font-weight: bold;
        padding-left: 5%;
        padding-top: 2%;
        text-transform: uppercase;
    }

    .logo span {
        font-size: 45px;
        font-weight: normal;
        color: rgb(0, 250, 200);
        text-transform: capitalize;
    }

    #flip {
        text-align: center;
        background-color: rgba(0, 100, 50, 0.2);
        width: 100%;
        clear: both;
        display: none;
        height: 40px;
        border-top: 3px solid rgb(0, 250, 200);
    }

    #flip p {
        padding-top: 1%;
        font-size: 20px;
        color: gray;
        text-transform: uppercase;
        letter-spacing: 0.3em;
    }

    a {
        text-decoration: none;
        color: #fff;
        transition: all 1s ease;
    }

    nav {
        width: 45%;
        height: 80px;
        float: left;
        background-color: rgba(0, 0, 0, 0.8);
        border-bottom: 3px solid rgb(0, 250, 200);
        transition: color 1s ease;
        -moz-transition: color 1s ease;
        -webkit-transition: color 1s ease;
    }

    nav ul li {
        list-style: none;
        color: white;
        float: left;
        font-size: 22px;
        padding: 4% 3.5%;
        transition: all 0.5s ease;
    }

    nav ul li:hover {
        background-color: rgba(0, 0, 0, 0.2);
        border-top: 3px solid red;
        height: auto;
    }

    .active {
        background-color: rgba(0, 0, 0, 0.3);
        height: auto;
    }

    .active a {
        transition: all 1s ease;
        color: rgb(0, 250, 200);
    }

    @media(max-width:1280px) {

        * {
            font-size: 18px;
        }

        .logo p {
            font-size: 38px;
            padding-left: 8%;
        }

        nav ul li {
            font-size: 19px;
            padding: 4.8% 3.3%;
        }
    }

    @media(max-width:1024px) {

        * {
            font-size: 17px;
        }

        .logo,
        nav {
            height: 75px;
        }

        .logo p {
            font-size: 35px;
            padding-left: 8%;
            padding-top: 2%;

        }

        .logo p span {
            font-size: 40px;
        }

        nav ul li {
            font-size: 18px;
            padding: 5.3% 3.5%;
            height: auto;
        }

    }

    @media(max-width:768px) {

        .logo {
            width: 100%;
            background-color: rgba(0, 0, 0, 0.1);
            clear: both;
            text-align: center;
            border: none;
            height: 90px;
        }

        .logo p {
            font-size: 36px;
            padding-left: 0;
        }

        .logo p span {
            font-size: 45px;
        }

        #flip {
            display: block;
        }

        #nav {
            width: 100%;
            height: 100%;
            display: none;
        }

        #nav ul li {
            border-bottom: 2px solid rgba(0, 0, 0, 0.1);
            width: 100%;
            padding: 1% 0%;
            text-align: center;
        }
    }
</style>

</head>
<body>

    <div class="title" align="center">
        <h3></h3>
    </div>
    <div class="header">
        <div class="logo">
            <p>Billage<span>town</span></p>
        </div>
        <div id="flip">
            <p>Menu</p>
        </div>
        <nav id="nav">
            <ul>
                <li class="active"><a href="#">모임</a></li>
                <li><a href="#">연재</a></li>
                <li><a href="#">대여</a></li>
                <li><a href="list.re">리뷰</a></li>
                <li><a href="list.dr">추첨</a></li>
                <li><a href="list.ac">경매</a></li>
                <li><a href="#">마을</a></li>
            </ul>
        </nav>
    </div>
    
</body>
</html>