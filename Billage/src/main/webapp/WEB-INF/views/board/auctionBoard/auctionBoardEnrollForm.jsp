<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매글 작성</title>

<style>
    .outer{
        width : 800px;
        margin : auto;
    }
    .longdiv {
        width : 800px;
    }
    .shortdiv {
        width : 400px;
    }
    .inputdiv{
        width : 310px;
    }
    .textdiv{
        width : 80px;
    }
    .align-side{
        display: flex;
        justify-content: space-evenly;
    }    
    .align-left{
        display: flex;
    }
    .titlediv {
        width : 710px;
    }
    .btntitle {
        margin-top: 8px;
        margin-bottom: 8px;
        margin-left: 0px;
    }
    .btnleft {
        width : 384px;
        margin-right : 10px;
        margin-top : 8px;
    }
    .btnright {
        width : 384px;
        margin-left : 10px;
        margin-top : 8px;
    }
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<jsp:include page="../../common/header.jsp"/>

    <div class="outer">

        <form action="insert.ac">

            <div class="longdiv align-left">
                <div class="textdiv">
                    <p>Email:</p>
                </div>
                <div class="titlediv">
                    <input type="text" class="form-control" id="uname" placeholder="Enter username" name="uname" required>
                </div>
            </div>


            <div class="longdiv align-left">
                <div class="shortdiv align-left">
                    <div class="textdiv">
                        <p>Email:</p>
                    </div>
                    <div class="inputdiv">
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                </div>
                <div class="shortdiv align-left">
                    <div class="textdiv">
                        <p>Email:</p>
                    </div>
                    <div class="inputdiv">
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                </div>
            </div>

            <div class="longdiv align-left">
                <div class="shortdiv align-left">
                    <div class="textdiv">
                        <p>Email:</p>
                    </div>
                    <div class="inputdiv">
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                </div>
                <div class="shortdiv align-left">
                    <div class="textdiv">
                        <p>Email:</p>
                    </div>
                    <div class="inputdiv">
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                </div>
            </div>

            <div class="longdiv align-left">
                <div class="shortdiv align-left">
                    <div class="textdiv">
                        <p>Email:</p>
                    </div>
                    <div class="inputdiv">
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                </div>
                <div class="shortdiv align-left">
                    <div class="textdiv">
                        <p>Email:</p>
                    </div>
                    <div class="inputdiv">
                        <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
                    </div>
                </div>
            </div>
            

            <div style="width : 790px;">
                <textarea class="form-control" rows="15" id="boardContent" style="resize: none;" placeholder="내용을 입력하세요"></textarea>
            </div>

            <div class="longdiv align-left">
                <div class="btnleft btn btn-dark">
                    <p class="btntitle">등록</p>
                </div>
                <div class="btnright btn btn-secondary">
                    <p class="btntitle ">취소</p>
                </div>
            </div>
        </form> 
    </div>

    </div>

    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>