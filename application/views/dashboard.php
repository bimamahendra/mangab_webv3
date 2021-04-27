<!DOCTYPE html>
<html>

<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title> MaNgab </title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="<?= base_url('assets/images/icon.png') ?>">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="<?= base_url('assets/css/simple-sidebar.css') ?>">

	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<div class="d-flex" id="wrapper">
		<nav class="bg-light border-right" id="sidebar-wrapper">
			<div class="sidebar-heading" > Mahasiswa Ngabsen <br><b>| MaNgab </b> </div>
			<div class="list-group list-group-flush">
				<?php if($this->session->userdata('isDosen')){ ?>
					<a href="<?= base_url(); ?>" class="list-group-item list-group-item-action bg-light"><span class="fa fa-dashboard"></span> Dashboard</a>
					<a href="<?= base_url('Generate/absenlist'); ?>" class="list-group-item list-group-item-action bg-light"><span class="fa fa-qrcode"></span> Generate QR Code</a>
					<a href="<?= base_url('Generate/history'); ?>" class="list-group-item list-group-item-action bg-light"><span class="fa fa-list"></span> History</a>
					<a href="<?= base_url('Generate/changepw'); ?>" class="list-group-item list-group-item-action bg-light"><span class="fa fa-key"></span> Ubah Password</a>
				<?php } else { ?>
					<a href="<?= base_url(); ?>" class="list-group-item list-group-item-action bg-light"><span class="fa fa-dashboard"></span> Dashboard</a>
					<a href="<?= base_url('Mahasiswa'); ?>" class="list-group-item list-group-item-action bg-light"><span class="fa fa-users"></span> Data Mahasiswa</a>
					<a href="<?= base_url('Dosen'); ?>" class="list-group-item list-group-item-action bg-light"><span class="fa fa-user"></span> &nbsp;Data Dosen</a>
					<a href="<?= base_url('Absen'); ?>" class="list-group-item list-group-item-action bg-light"><span class="fa fa-list"></span> Rekap Kehadiran</a>
				<?php } ?>
			</div>
		</nav>
		<!-- /#sidebar-wrapper -->
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<nav class="navbar navbar-expand-lg border-bottom"  style="background:#3032A0">
				<!-- <button class="btn btn-light" id="menu-toggle"><i class="fa fa-bars"></i></button>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button> -->
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item" style="color: white"> <b> <?php echo ($this->session->userdata('isDosen')) ? 'Selamat Mengajar, '.$this->session->userdata('nama') : $page_title ?> </b> <br></li>
					</ul>
					<ul class="navbar-nav ml-auto mt-2 mt-lg-0">
						<li class="nav-item"> <a class="nav-link" href="<?= base_url('login/logout'); ?>" style="color:white">Keluar <span class="fa fa-sign-out" style="color: white"></span><br></a> </li>
					</ul>
				</div>
			</nav>
			<div class="container-fluid">
				<?php $this->load->view($main_content); ?>
			</div>
		</div>	
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

<script>
	$("#menu-toggle").click(function(e) {
		e.preventDefault();
		$("#wrapper").toggleClass("toggled");
	});
	$(document).ready(function() {
		$('#newstable').DataTable( {
			"paging":   true,
			"ordering": false,
			"info":     false
		});
		$('#recap').DataTable( {
			"paging":   false,
			"ordering": false,
			"info":     false
		});
	});
</script>

</html>