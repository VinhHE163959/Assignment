<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
        <link rel="icon" type="image/png" href="assets/img/favicon.png">
        <title>
            Wallet Management
        </title>
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
        <!-- Nucleo Icons -->
        <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
        <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
        <!-- Font Awesome Icons -->
        <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
        <!-- Material Icons --> 
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
        <!-- CSS Files -->
        <link id="pagestyle" href="assets/css/material-dashboard.css?v=3.0.4" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>

    <body class="g-sidenav-show  bg-gray-200">
        <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">
            <div class="sidenav-header">
                <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
                <a class="navbar-brand m-0" href=" https://demos.creative-tim.com/material-dashboard/pages/dashboard " target="_blank">
                    <img src="assets/img/logo-ct.png" class="navbar-brand-img h-100" alt="main_logo">
                    <span class="ms-1 font-weight-bold text-white">Wallet Management</span>
                </a>
            </div>
            <hr class="horizontal light mt-0 mb-2">
            <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link text-white active bg-gradient-primary" href="pages/dashboard.html">
                            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="material-icons opacity-10">dashboard</i>
                            </div>
                            <span class="nav-link-text ms-1">Wallet</span>
                        </a>
                    </li>
                    
                    <li class="nav-item mt-3">
                        <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">Account pages</h6>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white " href="pages/profile.html">
                            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="material-icons opacity-10">person</i>
                            </div>
                            <span class="nav-link-text ms-1">Profile</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white " href="pages/sign-in.html">
                            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="material-icons opacity-10">login</i>
                            </div>
                            <span class="nav-link-text ms-1">Sign In</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white " href="pages/sign-up.html">
                            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                                <i class="material-icons opacity-10">assignment</i>
                            </div>
                            <span class="nav-link-text ms-1">Sign Up</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
        <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
            <!-- Navbar -->
            <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" data-scroll="true">
                <div class="container-fluid py-1 px-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
                            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">Pages</a></li>
                            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Dashboard</li>
                        </ol>
                        <h6 class="font-weight-bolder mb-0">Dashboard</h6>
                    </nav>
                    <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
                        <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                            <div class="input-group input-group-outline">
                                <label class="form-label">Type here...</label>
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <ul class="navbar-nav  justify-content-end">
                            <c:if test="${user!=null}">

                                <li class="nav-item d-flex align-items-center">
                                    Welcome, ${user.fullname}
                                    <a href="signout" class="nav-link text-body font-weight-bold px-0">
                                        <i class="fa fa-user me-sm-1"></i>
                                        <span class="d-sm-inline d-none">Sign out</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${user==null}">
                                <li class="nav-item d-flex align-items-center">
                                    <a href="login" class="nav-link text-body font-weight-bold px-0">
                                        <i class="fa fa-user me-sm-1"></i>
                                        <span class="d-sm-inline d-none">Sign In</span>
                                    </a>
                                </li>
                                <li class="nav-item d-flex align-items-center">
                                    <a href="signup" class="nav-link text-body font-weight-bold px-0">
                                        <i class="fa fa-user me-sm-1"></i>
                                        <span class="d-sm-inline d-none">Sign up</span>
                                    </a>
                                </li>
                            </c:if>
                            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
                                <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                                    <div class="sidenav-toggler-inner">
                                        <i class="sidenav-toggler-line"></i>
                                        <i class="sidenav-toggler-line"></i>
                                        <i class="sidenav-toggler-line"></i>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item px-3 d-flex align-items-center">
                                <a href="javascript:;" class="nav-link text-body p-0">
                                    <i class="fa fa-cog fixed-plugin-button-nav cursor-pointer"></i>
                                </a>
                            </li>
                            <li class="nav-item dropdown pe-2 d-flex align-items-center">
                                <a href="javascript:;" class="nav-link text-body p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fa fa-bell cursor-pointer"></i>
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end  px-2 py-3 me-sm-n4" aria-labelledby="dropdownMenuButton">
                                    <li class="mb-2">
                                        <a class="dropdown-item border-radius-md" href="javascript:;">
                                            <div class="d-flex py-1">
                                                <div class="my-auto">
                                                    <img src="assets/img/team-2.jpg" class="avatar avatar-sm  me-3 ">
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="text-sm font-weight-normal mb-1">
                                                        <span class="font-weight-bold">New message</span> from Laur
                                                    </h6>
                                                    <p class="text-xs text-secondary mb-0">
                                                        <i class="fa fa-clock me-1"></i>
                                                        13 minutes ago
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="mb-2">
                                        <a class="dropdown-item border-radius-md" href="javascript:;">
                                            <div class="d-flex py-1">
                                                <div class="my-auto">
                                                    <img src="assets/img/small-logos/logo-spotify.svg" class="avatar avatar-sm bg-gradient-dark  me-3 ">
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="text-sm font-weight-normal mb-1">
                                                        <span class="font-weight-bold">New album</span> by Travis Scott
                                                    </h6>
                                                    <p class="text-xs text-secondary mb-0">
                                                        <i class="fa fa-clock me-1"></i>
                                                        1 day
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item border-radius-md" href="javascript:;">
                                            <div class="d-flex py-1">
                                                <div class="avatar avatar-sm bg-gradient-secondary  me-3  my-auto">
                                                    <svg width="12px" height="12px" viewBox="0 0 43 36" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                                    <title>credit-card</title>
                                                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                    <g transform="translate(-2169.000000, -745.000000)" fill="#FFFFFF" fill-rule="nonzero">
                                                    <g transform="translate(1716.000000, 291.000000)">
                                                    <g transform="translate(453.000000, 454.000000)">
                                                    <path class="color-background" d="M43,10.7482083 L43,3.58333333 C43,1.60354167 41.3964583,0 39.4166667,0 L3.58333333,0 C1.60354167,0 0,1.60354167 0,3.58333333 L0,10.7482083 L43,10.7482083 Z" opacity="0.593633743"></path>
                                                    <path class="color-background" d="M0,16.125 L0,32.25 C0,34.2297917 1.60354167,35.8333333 3.58333333,35.8333333 L39.4166667,35.8333333 C41.3964583,35.8333333 43,34.2297917 43,32.25 L43,16.125 L0,16.125 Z M19.7083333,26.875 L7.16666667,26.875 L7.16666667,23.2916667 L19.7083333,23.2916667 L19.7083333,26.875 Z M35.8333333,26.875 L28.6666667,26.875 L28.6666667,23.2916667 L35.8333333,23.2916667 L35.8333333,26.875 Z"></path>
                                                    </g>
                                                    </g>
                                                    </g>
                                                    </g>
                                                    </svg>
                                                </div>
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="text-sm font-weight-normal mb-1">
                                                        Payment successfully completed
                                                    </h6>
                                                    <p class="text-xs text-secondary mb-0">
                                                        <i class="fa fa-clock me-1"></i>
                                                        2 days
                                                    </p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- End Navbar -->
            <div class="container-fluid py-4">
                <div class="row">
                    <c:forEach items="${lsWallet}"  var="w">
                        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
                            <div class="card">
                                <div class="card-header p-3 pt-2">
                                    <div class="icon icon-lg icon-shape bg-gradient-success shadow-success text-center border-radius-xl mt-n4 position-absolute">
                                        <a href="wallet?walletId=${w.walletId}"> <i class="material-icons opacity-10">weekend</i></a>
                                    </div>
                                    <div class="icon icon-lg icon-shape bg-gradient-warning shadow-success text-center border-radius-xl mt-n4 mx-6 position-absolute">
                                        <a onclick="setWalletId(${w.walletId},${w.categoryId})" data-bs-toggle="modal" data-bs-target="#staticBackdrop" href="#"> <i class="material-icons opacity-10">add</i></a>
                                    </div>
                                    <div class="text-end pt-1">
                                        <p class="text-sm mb-0 text-capitalize">${w.categoryName}</p>
                                        <h4 class="mb-0">$${w.amount}</h4>
                                    </div>
                                </div>
                                <hr class="dark horizontal my-0">
                                <div class="card-footer p-3">
                                    <c:if test="${w.lastTransaction!=null}">
                                        <p class="mb-0">
                                            <c:if test="${w.lastTransaction.type eq true}">
                                                <span class="text-success text-sm font-weight-bolder"> +${w.lastTransaction.amount/w.amount}% </span>
                                            </c:if>
                                            <c:if test="${w.lastTransaction.type eq false}">
                                                <span class="text-success text-sm font-weight-bolder"> -${w.lastTransaction.amount/w.amount}% </span>
                                            </c:if>
                                            than last week</p>
                                        </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="row mb-4 mt-3">
                    <div class="col-lg-8 col-md-6 mb-md-0 mb-4">
                        <div class="card">
                            <div class="card-header pb-0">
                                <div class="row">
                                    <div class="col-lg-6 col-7">
                                        <h6>Projects</h6>
                                        <p class="text-sm mb-0">
                                            <i class="fa fa-check text-info" aria-hidden="true"></i>
                                            <span class="font-weight-bold ms-1">${lsTrans.size()} done</span> this month
                                        </p>
                                    </div>
                                    <div class="col-lg-6 col-5 my-auto text-end">
                                        <div class="dropdown float-lg-end pe-4">
                                            <a class="cursor-pointer" id="dropdownTable" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="fa fa-ellipsis-v text-secondary"></i>
                                            </a>
                                            <ul class="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5" aria-labelledby="dropdownTable">
                                                <li><a class="dropdown-item border-radius-md" href="javascript:;">Action</a></li>
                                                <li><a class="dropdown-item border-radius-md" href="javascript:;">Another action</a></li>
                                                <li><a class="dropdown-item border-radius-md" href="javascript:;">Something else here</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body px-0 pb-2">
                                <div class="table-responsive">
                                    <table class="table align-items-center mb-0">
                                        <thead>
                                            <tr>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Companies</th>
                                                <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Members</th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Budget</th>
                                                <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Completion</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${lsTrans}" var="t">
                                                <tr>
                                                    <td>
                                                        <div class="d-flex px-2 py-1">
                                                            <div>
                                                                <img src="assets/img/small-logos/logo-atlassian.svg" class="avatar avatar-sm me-3" alt="xd">
                                                            </div>
                                                            <div class="d-flex flex-column justify-content-center">
                                                                <h6 class="mb-0 text-sm">${t.categoryName}</h6>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="avatar-group mt-2">
                                                            <p class="text-sm">
                                                                <c:if test="${t.type}">
                                                                    <i class="fa fa-arrow-up text-success" aria-hidden="true"></i>
                                                                </c:if>
                                                                <c:if test="${!t.type}">
                                                                    <i class="fa fa-arrow-down text-danger" aria-hidden="true"></i>
                                                                </c:if>
                                                            </p>
                                                        </div>
                                                    </td>
                                                    <td class="align-middle text-center text-sm">
                                                        <span class="text-xs font-weight-bold"> $${t.amount} </span>
                                                    </td>
                                                    <td class="align-middle">
                                                        <div class="progress-wrapper w-75 mx-auto">
                                                            <div class="progress-info">
                                                                <div class="progress-percentage">
                                                                    <span class="text-xs font-weight-bold">${t.date}</span>
                                                                </div>
                                                            </div>
                                                            <div class="progress">
                                                                <div class="progress-bar bg-gradient-info w-60" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="card h-100">
                            <div class="card-header pb-0">
                                <h6>Wallet details: ${w.categoryName}</h6>    
                                <p class="text-sm">
                                    <i class="fa fa-arrow-up text-success" aria-hidden="true"></i>
                                    <span class="font-weight-bold">24%</span> this month
                                </p>
                            </div>
                            <div class="card-body p-3">
                                <div class="timeline timeline-one-side">
                                    <c:forEach items="${lsTransDetails}" var="t">
                                        <div class="timeline-block mb-3">
                                            <span class="timeline-step">
                                                <i class="material-icons text-success text-gradient">notifications</i>
                                            </span>
                                            <div class="timeline-content">
                                                <h6 class="${t.type?'text-success':'text-danger'} text-sm font-weight-bold mb-0">$${t.amount}, ${t.note}</h6>
                                                <p class="text-secondary font-weight-bold text-xs mt-1 mb-0">${t.date}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer py-4  ">
                    <div class="container-fluid">
                        <div class="row align-items-center justify-content-lg-between">
                            <div class="col-lg-6 mb-lg-0 mb-4">
                                
                            </div>
                            
                        </div>
                    </div>
                </footer>
            </div>
        </main>
        <div class="fixed-plugin">
            <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
                <i class="material-icons py-2">settings</i>
            </a>
            <div class="card shadow-lg">
                <div class="card-header pb-0 pt-3">
                    <div class="float-start">
                        <h5 class="mt-3 mb-0">Material UI Configurator</h5>
                        <p>See our dashboard options.</p>
                    </div>
                    <div class="float-end mt-4">
                        <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
                            <i class="material-icons">clear</i>
                        </button>
                    </div>
                    <!-- End Toggle Button -->
                </div>
                <hr class="horizontal dark my-1">
                <div class="card-body pt-sm-3 pt-0">
                    <!-- Sidebar Backgrounds -->
                    <div>
                        <h6 class="mb-0">Sidebar Colors</h6>
                    </div>
                    <a href="javascript:void(0)" class="switch-trigger background-color">
                        <div class="badge-colors my-2 text-start">
                            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
                            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
                        </div>
                    </a>
                    <!-- Sidenav Type -->
                    <div class="mt-3">
                        <h6 class="mb-0">Sidenav Type</h6>
                        <p class="text-sm">Choose between 2 different sidenav types.</p>
                    </div>
                    <div class="d-flex">
                        <button class="btn bg-gradient-dark px-3 mb-2 active" data-class="bg-gradient-dark" onclick="sidebarType(this)">Dark</button>
                        <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-transparent" onclick="sidebarType(this)">Transparent</button>
                        <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
                    </div>
                    <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
                    <!-- Navbar Fixed -->
                    <div class="mt-3 d-flex">
                        <h6 class="mb-0">Navbar Fixed</h6>
                        <div class="form-check form-switch ps-0 ms-auto my-auto">
                            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
                        </div>
                    </div>
                    <hr class="horizontal dark my-3">
                    <div class="mt-2 d-flex">
                        <h6 class="mb-0">Light / Dark</h6>
                        <div class="form-check form-switch ps-0 ms-auto my-auto">
                            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
                        </div>
                    </div>
                    <hr class="horizontal dark my-sm-4">
                    <a class="btn bg-gradient-info w-100" href="https://www.creative-tim.com/product/material-dashboard-pro">Free Download</a>
                    <a class="btn btn-outline-dark w-100" href="https://www.creative-tim.com/learning-lab/bootstrap/overview/material-dashboard">View documentation</a>
                    <div class="w-100 text-center">
                        <a class="github-button" href="https://github.com/creativetimofficial/material-dashboard" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star creativetimofficial/material-dashboard on GitHub">Star</a>
                        <h6 class="mt-3">Thank you for sharing!</h6>
                        <a href="https://twitter.com/intent/tweet?text=Check%20Material%20UI%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fsoft-ui-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
                            <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
                        </a>
                        <a href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/material-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
                            <i class="fab fa-facebook-square me-1" aria-hidden="true"></i> Share
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Create Transactions in ${w.categoryName}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="wallet" method="post">
                        <input hidden="" name="walletId" id="walletId" />
                        <input hidden="" name="categoryId" id="categoryId" />
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">Note</label>
                                <textarea name="note" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="exampleFormControlTextarea1" class="form-label">Amount</label>
                                <input name="amount" class="form-control" name="amount" id="exampleFormControlTextarea1" />
                            </div>
                            <input type="radio" class="btn-check" name="type" value="true" id="success-outlined" autocomplete="off" checked>
                            <label class="btn btn-outline-success" for="success-outlined">Credit</label>

                            <input type="radio" class="btn-check" name="type" value="false" id="danger-outlined" autocomplete="off">
                            <label class="btn btn-outline-danger" for="danger-outlined">Debit</label>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Confirrm</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            const setWalletId = (id, cid) => {
                document.getElementById("walletId").value = id;
                document.getElementById("categoryId").value = cid;
            }
        </script>
        <!--   Core JS Files   -->
        <script src="assets/js/core/popper.min.js"></script>
        <script src="assets/js/core/bootstrap.min.js"></script>
        <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
        <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
        <script src="assets/js/plugins/chartjs.min.js"></script>

        <script>
            var win = navigator.platform.indexOf('Win') > -1;
            if (win && document.querySelector('#sidenav-scrollbar')) {
                var options = {
                    damping: '0.5'
                }
                Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
            }
        </script>
        <!-- Github buttons -->
        <script async defer src="https://buttons.github.io/buttons.js"></script>
        <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
        <script src="assets/js/material-dashboard.min.js?v=3.0.4"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>

</html>