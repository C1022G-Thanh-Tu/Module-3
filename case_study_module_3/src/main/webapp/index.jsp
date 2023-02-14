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
  <title>Home</title>
  <link rel="stylesheet" href="index_css.css">
  <link rel="stylesheet" href="../themify-icons/themify-icons.css">
  <link rel="stylesheet" href="../css/bootstrap.css">
</head>

<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Group 3</a>
    <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">
            Home
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">
            Contact
          </a>
        </li>
        <li class="nav-item dropdown">
          <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
          >
            Menu
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Action</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider" /></li>
            <li>
              <a class="dropdown-item" href="#">Something else here</a>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-warning" href="">
            <i class="ti-shopping-cart"></i>
<%--            Shopping Bag--%>
          </a>
        </li>
      </ul>
      <div class="action nav-item">
        <form class="d-flex" role="search">
          <input
                  class="form-control me-2"
                  type="search"
                  placeholder="Search"
                  aria-label="Search"
          />
          <button class="btn btn-outline-success" type="submit">
            Search
          </button>
        </form>
        <div class="hide__on__mobile logout">
          Logout
        </div>
      </div>
      <div class="navbar-nav mt-4">
        <div class="logout-responsive">Logout</div>
      </div>
    </div>
  </div>
</nav>

<div id="content">
  <div class="content-header mb-5 text-center">
    <h1>Menu</h1>
  </div>
  <div class="row g-4">
    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%">
        <img src="../img/bún bò huế.jfif" class="card-img-top" alt="..." />
        <div class="card-body">
          <h5 class="card-title">Bún bò huế</h5>
          <p class="card-text">
            Some quick example text to build on the card title and make up
            the bulk of the card's content.
          </p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%">
        <img src="../img/phở.jfif" class="card-img-top" alt="..." />
        <div class="card-body">
          <h5 class="card-title">Phở Hà Nội</h5>
          <p class="card-text">
            Some quick example text to build on the card title and make up
            the bulk of the card's content.
          </p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%">
        <img src="../img/cơm tấm.jfif" class="card-img-top" alt="..." />
        <div class="card-body">
          <h5 class="card-title">Cơm tấm</h5>
          <p class="card-text">
            Some quick example text to build on the card title and make up
            the bulk of the card's content.
          </p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>

    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%">
        <img src="../img/bún bò huế.jfif" class="card-img-top" alt="..." />
        <div class="card-body">
          <h5 class="card-title">Bún bò huế</h5>
          <p class="card-text">
            Some quick example text to build on the card title and make up
            the bulk of the card's content.
          </p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%">
        <img src="../img/phở.jfif" class="card-img-top" alt="..." />
        <div class="card-body">
          <h5 class="card-title">Phở Hà Nội</h5>
          <p class="card-text">
            Some quick example text to build on the card title and make up
            the bulk of the card's content.
          </p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 col-sm-12">
      <div class="card" style="width: 100%">
        <img src="../img/cơm tấm.jfif" class="card-img-top" alt="..." />
        <div class="card-body">
          <h5 class="card-title">Cơm tấm</h5>
          <p class="card-text">
            Some quick example text to build on the card title and make up
            the bulk of the card's content.
          </p>
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
        <p class="py-3 para-light">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquam
          atque, deserunt doloremque doloribus et facere, illo ipsam iste
          molestiae, necessitatibus nobis nulla officia perspiciatis qui
          ratione similique suscipit vel voluptatem!
        </p>
      </div>

      <div class="col-lg-3 py-4 py-md-5">
        <div>
          <h4 class="py-2">Contact</h4>
          <div class="d-flex align-items-center py-2">
            <i class="ti-location-pin"></i>
            <a href="#about">
              <p class="ms-3 mb-0">123 Street, New York, USA</p>
            </a>
          </div>
          <div class="d-flex align-items-center py-2">
            <i class="ti-mobile"></i>
            <a href="#">
              <p class="ms-3 mb-0">+01 2000 800 9999</p>
            </a>
          </div>
          <div class="d-flex align-items-center py-2">
            <i class="ti-email"></i>
            <a href="#">
              <p class="ms-3 mb-0">info@domain.com</p>
            </a>
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
            <a href="#">
              <p class="ms-3 mb-0">For Artists</p>
            </a>
          </div>
          <div class="d-flex align-items-center py-2">
            <i class="ti-angle-right"></i>
            <a href="#">
              <p class="ms-3 mb-0">Developers</p>
            </a>
          </div>
          <div class="d-flex align-items-center py-2">
            <i class="ti-angle-right"></i>
            <a href="#">
              <p class="ms-3 mb-0">Advertisement</p>
            </a>
          </div>
          <div class="d-flex align-items-center py-2">
            <i class="ti-angle-right"></i>
            <a href="#">
              <p class="ms-3 mb-0">Investors</p>
            </a>
          </div>
        </div>
      </div>

      <div class="col-lg-3 py-4 py-md-5">
        <div class="d-flex align-items-center">
          <h4>Subscribe</h4>
        </div>
        <p class="py-3 para-light">
          Lorem ipsum dolor sit amet, consectetur adipisicing elit.
          Reprehenderit, voluptatum?
        </p>
        <div class="d-flex align-items-center">
          <div class="input-group mb-3">
            <input
                    type="text"
                    class="form-control p-2"
                    placeholder="Enter Email"
                    aria-label="Recipient's email"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script src="../js/bootstrap.js"></script>
</body>
</body>

</html>
