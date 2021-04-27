<div class="py-1">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h5 class="display-4">
        <?php foreach($matkuldet as $row){ echo $row->KODE_MATKUL." | ".$row->NAMA_MATKUL;} ?>
        </h5>
      </div>
    </div>
  </div>
</div>
<div class="py-4">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive">
          <table class="table table-striped table-borderless" id="newstable">
            <thead>
              <tr>
                <th class="text-center">No</th>
                <th class="text-center">QR Code </th>
                <th class="text-center">Topik</th>
                <th class="text-center">Waktu</th>
                <th class="text-center">Note</th>
                <th class="text-center">Status</th>
              </tr>
            </thead>
            <tbody>
              <?php $i = 1; foreach ($datadet as $row) {?>
                <tr>
                  <td class="text-center"><?php echo $i ?></td>
                  <td><div class="text-center" style="margin: 0 auto;">
                    <a href="<?php echo base_url('Generate/showqr/'.$row->ID_ABSEN) ?>">
                      <img src="<?php echo base_url('assets/images/qr/'.$row->ID_ABSEN.'.png') ?>" height="50" width="50" class="img-fluid" alt="">
                    </a>
                  </div></td>
                  <td><?php echo $row->TOPIK ?></td>
                  <td class="text-center"><?php echo $row->TS_ABSEN ?></td>
                  <td><?php echo $row->NOTE ?></td>
                  <td class="text-center"><?php echo ($row->STATUS_ABSEN == 2) ? "<p class='btn btn-sm btn-success'>Terverifikasi</p>" : "<p class='btn btn-sm btn-danger'>Belum Verifikasi</p>" ?></td>
                </tr>
              <?php $i++;} ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>