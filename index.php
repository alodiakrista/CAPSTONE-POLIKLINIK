<?php
if (!isset($_SESSION)) {
    session_start();
}

include_once("koneksi.php");
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Sistem Temu Janji Poliklinik </title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link rel="stylesheet" href="http://<?= $_SERVER['HTTP_HOST'] ?>/poliweb/dist/css/welcome_styles.css">
</head>

<body>
    <!-- Responsive navbar-->
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color:#F08080">
    <div class="container px-4">
        <a class="navbar-brand" href="index.php">
            <img src="dist/img/clinic.png" alt="Logo" height="30" class="d-inline-block align-top me-2">
            <span style="color: #fff; font-weight: bold;">Poliklinik UDINUS</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
            </ul>
        </div>
    </div>
</nav>


<?php 
    if (isset($_GET['page'])) {
        if ($_GET['page'] === 'loginAdmin') {
            include_once ('./loginAdmin.php');
        } else if ($_GET['page'] === 'loginDokter') {
            include_once ('./loginDokter.php');
        } else if ($_GET['page'] === 'loginPasien') {
            include_once ('./loginPasien.php');
        } else {
            include($_GET['page'] . ".php");
        }
    } else {
?>

        <!-- Header-->
        <header class="py-5" style="background-color:  #ADD8E6; border-bottom: 5px solid #ADD8E6;"> <!-- Change Color Banner and Add Border Here -->
    <div class="container px-5" style="border-radius: 10px; box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.5);"> <!-- Add Border Radius and Box Shadow to the Container -->
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-6">
                <div class="text-center my-5">
                    <h1 class="display-4 fw-bold text-white mb-2">Sistem Temu Janji <br>Pasien-Dokter</h1> <!-- Change Heading Text and Font Size -->
                    <p class="lead text-white-50 mb-5">Bimbingan Karier Web Developer</p> <!-- Change Subtitle Text -->
                </div>
            </div>
        </div>
    </div>
</header>


    <!-- Features section-->
    <section class="py-5 border-bottom" id="features" style="background-color: #FFFFFF;">
    <div class="container px-5 my-5">
        <div class="row g-5">
            <div class="col-lg-4 mb-5">
                <div class="card" style="background-color: #ADD8E6; box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);">
                    <div class="card-body text-center">
                        <div class="feature mb-3"><i class="bi bi-person"></i></div>
                        <h2 class="h4 fw-bolder">Login Sebagai Admin</h2>
                        <p>Jika Anda adalah seorang Admin, silakan Login untuk mengelola data website!</p>
                        <a class="text-decoration-none" href="index.php?page=loginAdmin">
                            Klik Link Berikut
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-5">
                <div class="card" style="background-color: #ADD8E6; box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);">
                    <div class="card-body text-center">
                        <div class="feature mb-3"><i class="bi bi-person-circle"></i></div>
                        <h2 class="h4 fw-bolder">Login Sebagai Dokter</h2>
                        <p>Jika Anda adalah seorang Dokter, silakan Login untuk memulai melayani Pasien!</p>
                        <a class="text-decoration-none" href="index.php?page=loginDokter">
                            Klik Link Berikut
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-5">
                <div class="card" style="background-color:#ADD8E6; box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);">
                    <div class="card-body text-center">
                        <div class="feature mb-3"><i class="bi bi-person-plus"></i></div>
                        <h2 class="h4 fw-bolder">Login Sebagai Pasien</h2>
                        <p>Jika Anda adalah seorang Pasien, silakan Login untuk mulai menggunakan layanan kami!</p>
                        <a class="text-decoration-none" href="index.php?page=loginPasien">
                            Klik Link Berikut
                            <i class="bi bi-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Testimonials section-->
<section class="py-5 border-bottom" style="background-color: #FFFFFF;">
    <div class="container px-5 my-5">
        <div class="text-center mb-5">
            <h2 class="fw-bolder text-dark">Pengalaman Pasien Bersama Kami</h2>
            <p class="lead text-dark mb-0">Apa yang Mereka Katakan</p>
        </div>
        <div class="row gx-5 justify-content-center">
            <div class="col-lg-8">
                <div class="row">
                    <!-- Testimonial 1 (left) -->
                    <div class="col-lg-6">
                        <div class="card bg-light border-0 mb-4 p-4">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0"><i class="bi bi-chat-right-quote-fill text-primary fs-2"></i></div>
                                <div class="ms-4">
                                    <p class="mb-1 text-dark">Situs web ini memberikan pelayanan yang sangat baik. Saya merasa dihargai dan mendapat perhatian maksimal dari tim medis. Saya sungguh terbantu!</p>
                                    <div class="small text-muted">- Tita, Semarang</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Testimonial 2 (right) -->
                    <div class="col-lg-6">
                        <div class="card bg-light border-0 p-4">
                            <div class="d-flex align-items-center">
                                <div class="flex-shrink-0"><i class="bi bi-chat-right-quote-fill text-primary fs-2"></i></div>
                                <div class="ms-4">
                                    <p class="mb-1 text-dark">Saya senang menemukan situs web ini. Antarmuka pengguna yang ramah membuat segala proses menjadi mudah. Terima kasih atas pengalaman yang menyenangkan!</p>
                                    <div class="small text-muted">- Citra, Semarang</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- Footer-->
    <footer class="main-footer px-4 py-2" style="background-color: #F08080; color: #fff; text-align: center;">
    <strong>
        Copyright ©
        <script>
            document.write(new Date().getFullYear())
        </script>
        <a href="https://bengkelkoding.dinus.ac.id/" style="color: #fff;">Bengkel Koding</a>.
    </strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block" style="color: #fff;">
        <b>Version</b> 1.0.0
    </div>
</footer>
    <?php
        }
    ?>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>

</html>