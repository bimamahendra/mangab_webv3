<style type="text/css">
  tr{
    height: 20px;
  }
</style>

<div class="py-1">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center" style="margin-top: 15px"><h5>Scan QR Code dibawah ini untuk dapat mengikuti perkuliahan</h5></div>
      <button onclick="btnunik()" class="text-center btn-sm btn-success" style="margin: 0 auto; margin-bottom: 10px">Kode Unik</button>
    </div>
    <div class="row" style="display: none" id="unik">
        <h3 class="text-center" style="margin: 0 auto"><?php echo $uniqcode ?></h3>
    </div>
  </div>
</div>
<div class="py-4">
  <div class="container">
    <div class="row">
      <div class="text-center" style="margin: 0 auto; margin-top: -30px">
        <img src="<?php echo base_url('assets/images/qr/'.$uniqcode.'.png') ?>" height="400" width="400" class="img-fluid" alt="">
      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
       <div class="col-md-12">
        <div class="table-responsive">
          <table class="table table-striped table-borderless" id="newstable">
            <thead>
              <tr>
                <th class="text-center" style="width: 25px">No</th>
                <th class="text-center">NRP</th>
                <th class="text-center">Nama</th>
                <th class="text-center">Status</th>
              </tr>
            </thead>
            <tbody>
              <?php $i = 1;
              foreach ($datakelas as $mhs){ ?>
                <tr>
                  <td class="text-center"><?php echo $i ?></td>
                  <td class="text-center"><?php echo $mhs->NRP_MHS; ?></td>
                  <td class="text-left"><?php echo $mhs->NAMA_MHS ?></td>
                  <td class="text-center"><?php echo ($mhs->STATUS_DETABSEN == 0) ? "Alpa" : "Hadir"  ?></td>
                </tr>
              <?php $i++; } ?>
            </tbody>
          </table>
        </div>
      </div>
  </div>
</div>

<div class="container">
    <div class="row">
      <a class="btn btn-danger" style="margin: 0 auto; margin-bottom: 10px" href="<?php echo base_url('Generate/recap/'.$uniqcode) ?>"> SELESAI </a>
    </div>
</div>

<script type="text/javascript">
  function btnunik(){
    var x = document.getElementById("unik");
    if(x.style.display === "none"){
      x.style.display = "block";
    }else{
      x.style.display = "none";
    }
  }
</script>