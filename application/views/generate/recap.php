<style type="text/css">
tr{
  height: 20px;
}
</style>

<div class="py-1">
  <div class="container">
  </div>
</div>
<div class="py-4">
  <div class="container">
    <h3>Rekapitulasi Kehadiran Perkuliahan</h3>
  </div>

  <div class="container">
    <div class="row">
     <div class="col-md-12">
      <form method="post" name="absen" action="<?php echo base_url('Generate/confirm/'.$uniqcode) ?>">
      <div class="table-responsive">
        <table class="table table-striped table-borderless" id="recap">
          <thead>
            <tr>
              <th class="text-center" style="width: 25px">No</th>
              <th class="text-center">NRP</th>
              <th class="text-center">Nama</th>
              <th class="text-center">Status 
                <a href="javascript:void(0)" onclick="hadir()" id="hadirall" class="btn btn-sm btn-primary pull-right" style="margin-left: 10px">Hadir Semua</a>
                <a href="javascript:void(0)" onclick="alpa()" id="alpaall" class="btn btn-sm btn-danger pull-right">Alpa Semua</a>
              </th>
            </tr>
          </thead>
          <tbody>
            <?php $i = 1;
            foreach ($datamhs as $mhs){ ?>
              <tr>
                <td class="text-center"><?php echo $i ?></td>
                <td class="text-center"><?php echo $mhs->NRP_MHS; ?></td>
                <input type="hidden" name="<?php echo 'nrp'.$i ?>" value="<?php echo $mhs->NRP_MHS; ?>">
                <td class="text-left"><?php echo $mhs->NAMA_MHS ?></td>
                <td class="text-center pull-right" style="margin-right: 25px">
                    <label class="radio-inline" style="margin: 0px 15px">
                      <input class="rdo-alpa" type="radio" id="alpa" name="<?php echo 'radion'.$i ?>" value="0" checked="checked"> Alpa
                    </label>
                    <label class="radio-inline" style="margin: 0px 15px">
                      <input class="rdo-sakit" type="radio" id="sakit" name="<?php echo 'radion'.$i ?>" value="2"> Sakit
                    </label>
                    <label class="radio-inline"style="margin: 0px 15px">
                      <input class="rdo-izin" type="radio" id="izin" name="<?php echo 'radion'.$i ?>" value="3"> Izin
                    </label>
                    <label class="radio-inline" style="margin: 0px 15px">
                      <input class="rdo-hadir" type="radio" id="hadir" name="<?php echo 'radion'.$i ?>" value="1"> Hadir
                    </label>
                </td>
              </tr>
              <?php $i++; } ?>
            </tbody>
          </table>
        </div>
        <div class="form-group">
          <label for="note">Catatan:</label>
          <textarea class="form-control" rows="5" id="note" name="catatan"></textarea>
        </div>
        <div class="row">
          <button type="submit" class="btn btn-success text-center" style="margin: 0 auto">REKAP</button>
        </div>
        </form>
      </div>
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

    // function alpa() {
    //   // document.getElementById("alpa").checked = true;
    //   var radios = document.getElementsByClassName("rdo-alpa");
    //   for(var i = 0; i < radios.length; i++){
    //     radios[i].checked = true;
    //   }

    //   // checked = document.getElementById("alpa");
    //   // $('#alpa').prop('checked', true);
    // }

    // function hadir() {
    //   // document.getElementById("hadir").checked = true;
    //   var radios = document.getElementsByClassName("rdo-hadir");
    //   for(var i = 0; i < radios.length; i++){
    //     radios[i].checked = true;
    //   }
    // }

    // window.onload = function(){
    document.getElementById('hadirall').onclick = function(e){
        e.preventDefault();
        var radios = document.getElementsByClassName('rdo-hadir');
        for(var i = 0; i < radios.length; i++){
            radios[i].checked = true;    
        }
      }

    document.getElementById('alpaall').onclick = function(e){
        e.preventDefault();
        var radios = document.getElementsByClassName('rdo-alpa');
        for(var i = 0; i < radios.length; i++){
            radios[i].checked = true;    
        }
      }
    // }; 


  </script>