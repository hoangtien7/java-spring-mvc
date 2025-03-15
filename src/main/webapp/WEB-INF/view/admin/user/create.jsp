<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="Dự án laptopshop"/>
    <meta name="author" content=""/>
    <title>Create User</title>
    <link href="/css/styles.css" rel="stylesheet"/>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            const avatarPreview = $("#avatarPreview");
            avatarFile.change(function (e) {
                const file = e.target.files[0];
                if (!file) {
                    console.log("No file selected.");
                    avatarPreview.attr("src", "").css("display", "none");
                    return;
                }
                console.log(file);
                const imgURL = URL.createObjectURL(file);
                avatarPreview.attr("src", imgURL).css("display", "block");
            });
        });

    </script>

</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Manage User</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item"><a href="/admin/user">User</a></li>
                    <li class="breadcrumb-item active">Create</li>
                </ol>
                <div class="mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h3>Create a user</h3>
                            <hr>
                            <form:form method="POST" action="/admin/user/create" modelAttribute="newUser" enctype="multipart/form-data" class="row">
                                <div class="col-12 col-md-6 mb-3">
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Email:</label>
                                    <form:input type="text" class="form-control ${not empty errorEmail ? 'is-invalid' : ''}" path="email"/>
                                    ${errorEmail}
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <c:set var="errorPassword">
                                        <form:errors path="password" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Password:</label>
                                    <form:input type="password" class="form-control ${not empty errorPassword ? 'is-invalid' : ''}" path="password"/>
                                    ${errorPassword}
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label class="form-label">Phone number:</label>
                                    <form:input type="text" class="form-control" path="phone"/>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <c:set var="errorFullName">
                                        <form:errors path="fullName" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label class="form-label">Full Name:</label>
                                    <form:input type="text" class="form-control ${not empty errorPassword ? 'is-invalid' : ''}" path="fullName"/>
                                    ${errorFullName}
                                </div>
                                <div class="col-12 mb-3">
                                    <label class="form-label">Address:</label>
                                    <form:input type="text" class="form-control" path="address"/>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label class="form-label">Role:</label>
                                    <form:select class="form-select" path="role.name">
                                        <form:option value="ADMIN">ADMIN</form:option>
                                        <form:option value="USER">USER</form:option>
                                    </form:select>
                                </div>
                                <div class="col-12 col-md-6 mb-3">
                                    <label for="avatarFile" class="form-label">Avatar:</label>
                                    <input class="form-control" type="file" id="avatarFile" accept=".png, .jpg, .jpeg, .webp" name="avatarFile"/>
                                </div>
                                <div class="col-12 mb-3">
                                    <img style="max-height: 250px; display: none" id="avatarPreview" alt="avatar preview"/>
                                </div>
                                <div class="col-12 mb-5">
                                    <button type="submit" class="btn btn-primary">Create</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>

</html>