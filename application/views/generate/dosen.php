<style type="text/css">
    h3{
        display: inline;
    }

    h4 {
        display: inline;
    }
</style>

<h5 style="margin: 30px auto"> <span class="fa fa-book"></span> Rekapitulasi Kegiatan Perkuliahan</h5>

<div class="row">
    <?php foreach($dataout as $row) {  $i = 0; ?>
       
        <div class="col-md-4" style="margin-bottom: 20px">
            <div class="card text-center">
                <div class="card-header text-white bg-success" ><?php echo $row->NAMA_MATKUL." | ".$row->KELAS_MATKUL ?></div>
                <div class="card-body">
                    <div class="card-title"><h4><?php echo $row->jumlah ?></h4> <h3> / 14 </h3></div>
                </div>
            </div>
        </div>
        
    <?php $i++; } ?>
</div>