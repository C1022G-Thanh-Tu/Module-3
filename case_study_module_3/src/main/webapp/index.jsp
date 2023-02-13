<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 10/02/2023
  Time: 3:32 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="index_css.css">
  <link rel="stylesheet" href="../themify-icons/themify-icons.css">
  <link rel="stylesheet" href="../css/bootstrap.css">
</head>

<body>
<div id="header" class="fixed-top">
  <ul class="navi">
    <li><a href="" class="team">Group 3 </a></li>
    <li><a href="" class="rs">Home</a></li>
    <li><a href="" class="open-menu rs">
      Menu
      <i class="ti-angle-down"></i>
      <ul class="sub-nav">
        <li><a href="">Cơm</a></li>
        <li><a href="">Phở</a></li>
        <li><a href="">Mỳ</a></li>
        <li><a href="">Bún</a></li>
      </ul>
    </a></li>
    <li><a href="" class="rs">Contact</a></li>
    <li><a href="" class="rs"><i class="ti-bag"></i> Shopping bag</a></li>

  </ul>
  <div id="mobile-menu-btn" class="mobile-menu">
    <i class="ti-menu"></i>
  </div>
  <div class="search-section row">
    <form class="search" action="" method="post">
      <input type="search" placeholder="Search...">
      <button type="submit">Search</button>
    </form>
  </div>
  <div class="log-out">
    <a href="">
      Logout
      <i class="ti-shift-left"></i>
    </a>
  </div>
</div>
<div id="content">
  <div class="content-header mb-5 text-center">
    <h1>Menu</h1>
  </div>
  <div class="row mb-5">
    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%;">
        <img src="../img/bún bò huế.jfif" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Bún bò huế</h5>
          <p class="card-text">
            Some quick example text to build on the card title and make up the bulk of
            the card's content.
          </p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%;">
        <img src="../img/phở.jfif" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Phở Hà Nội</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of
            the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%;">
        <img src="../img/cơm tấm.jfif" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Cơm tấm</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of
            the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%;">
        <img src="../img/bún bò huế.jfif" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Bún bò huế</h5>
          <p class="card-text">
            Some quick example text to build on the card title and make up the bulk of
            the card's content.
          </p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%;">
        <img src="../img/phở.jfif" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Phở Hà Nội</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of
            the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%;">
        <img src="../img/cơm tấm.jfif" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Cơm tấm</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of
            the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- footer -->
<section class="footer bg-dark text-light">
  <div class="container">
    <div class="row" data-aos="fade-right">
      <div class="col-lg-3 py-4 py-md-5">
        <div class="d-flex align-items-center">
          <h4 class="">Group 3</h4>
        </div>
        <p class="py-3 para-light">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam atque,
          deserunt doloremque doloribus et facere, illo ipsam iste molestiae, necessitatibus nobis nulla
          officia perspiciatis qui ratione similique suscipit vel voluptatem!</p>
      </div>

      <div class="col-lg-3 py-4 py-md-5">
        <div>
          <h4 class="py-2">Contact</h4>
          <div class="d-flex align-items-center py-2">
            <i class="ti-location-pin"></i>
            <a href="#about"><p class="ms-3 mb-0">123 Street, New York, USA</p></a>
          </div>
          <div class="d-flex align-items-center py-2">
            <i class="ti-mobile"></i>
            <a href="#"><p class="ms-3 mb-0">+01 2000 800 9999</p></a>
          </div>
          <div class="d-flex align-items-center py-2">
            <i class="ti-email"></i>
            <a href="#"><p class="ms-3 mb-0">info@domain.com</p></a>
          </div>
          <div class="footer-icon d-flex align-items-center py-2">
            <i class="ti-instagram"></i>
            <i class="ti-facebook"></i>
            <i class="ti-twitter-alt"></i>
            <i class="ti-linkedin"></i>
            <i class="ti-youtube"></i>
          </div>
        </div>
      </div>

      <div class="col-lg-3 py-4 py-md-5">
        <div>
          <h4 class="py-2">Quick Links</h4>
          <div class="d-flex align-items-center py-2">
            <i class="ti-angle-right"></i>
            <a href="#"><p class="ms-3 mb-0">For Artists</p></a>

          </div>
          <div class="d-flex align-items-center py-2">
            <i class="ti-angle-right"></i>
            <a href="#"><p class="ms-3 mb-0">Developers</p></a>
          </div>
          <div class="d-flex align-items-center py-2">
            <i class="ti-angle-right"></i>
            <a href="#"><p class="ms-3 mb-0"> Advertisement</p></a>
          </div>
          <div class="d-flex align-items-center py-2">
            <i class="ti-angle-right"></i>
            <a href="#"><p class="ms-3 mb-0">Investors</p></a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 py-4 py-md-5">
        <div class="d-flex align-items-center">
          <h4>Subscribe</h4>
        </div>
        <p class="py-3 para-light">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reprehenderit, voluptatum?</p>
        <div class="d-flex align-items-center">
          <div class="input-group mb-3">
            <input type="text" class="form-control p-2" placeholder="Enter Email"
                   aria-label="Recipient's email">
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<%--<script>--%>
<%--  let header = document.getElementById('header');--%>
<%--  let mobileMenu = document.getElementById('mobile-menu-btn');--%>
<%--  let headerHeight = header.clientHeight;--%>

<%--  function showHiddenMenu () {--%>
<%--    let isClosed = header.clientHeight === headerHeight;--%>
<%--    if (isClosed) {--%>
<%--      header.style.height = 'auto';--%>
<%--    } else {--%>
<%--      header.style.height = null;--%>
<%--    }--%>
<%--  }--%>
<%--  mobileMenu.addEventListener('click', showHiddenMenu);--%>

<%--</script>--%>
<script src="../js/bootstrap.js"></script>
</body>

</html>
