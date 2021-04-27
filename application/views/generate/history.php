<div class="py-1">
  <div class="container">
    <div class="row">
      <!-- <div class="col-md-12"><h3 class="display-3">Mahasiswa</h3></div> -->
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
                <th class="text-center">Nama Mata Kuliah  </th>
                <th class="text-center">Kelas</th>
                <th class="text-center">Topik</th>
                <th class="text-center">Waktu</th>
                <th class="text-center">Status</th>
              </tr>
            </thead>
            <tbody>
              <?php $i = 1; foreach ($listhistory as $row) {?>
                <tr>
                  <td class="text-center"><?php echo $i ?></td>
                  <td><?php echo $row->NAMA_MATKUL ?></td>
                  <td class="text-center"><?php echo $row->KELAS_MATKUL ?></td>
                  <td><?php echo $row->TOPIK ?></td>
                  <td class="text-center"><?php echo $row->TS_ABSEN ?></td>
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