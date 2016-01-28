<script src="vendor/components/jquery/jquery.min.js"></script>
<?php if ($auth->is_admin): ?>
    <h3 id="toggler">Broneeringud</h3>
    <div id="list">
    <? foreach ($broneerings as $day => $items) {
         echo "<ul class=\"list-group\">";
            if (!empty($items)) {
                echo "<li class=\"list-group-item list-group-item-info\">$day</li>";
                foreach ($items as $item) {
                    echo "<li class=\"list-group-item\"><a href=\"broneering/view/" . $item['broneering_id'] . "\">" . $item['inimeste_arv'] . " inimest kell " . $item['kellaeg'] . "</a></li>";
                }
            }
         echo "</ul>";
    }; ?>
    </div>
<?php endif; ?>

<h3>Lisa broneering</h3>

<form method="post" id="form">
    <select id="date" name="data[kuupaeva_id]">
        <? foreach ($dates as $date): ?>
            <option value="<?= $date['kuupaeva_id'] ?>" ><?= $date['kuupaev'] ?></option>
        <? endforeach ?>
    </select>
    <select id="time" name="data[kellaja_id]">
        <? foreach ($times as $time): ?>
            <option value="<?= $time['kellaja_id'] ?>" ><?= $time['kellaeg'] ?></option>
        <? endforeach ?>
    </select>
    <table class="table table-bordered">
        <tr>
            <th>Inimeste arv <span style="color:red" id="numbercontrol"></span></th>
            <td><input type="text" name="data[inimeste_arv]" value=""/></td>
        </tr>
        <tr>
            <th>Eelrooga arv</th>
            <td><input type="text" name="data[eelrooga_arv]" value=""/></td>
        </tr>
        <tr>
            <th>Pohirooga arv</th>
            <td><input type="text" name="data[pohirooga_arv]" value=""/></td>
        </tr>
        <tr>
            <th>Järelrooga arv</th>
            <td><input type="text" name="data[jarelrooga_arv]" value=""/></td>
        </tr>
    </table>

    <input type="hidden" name="data[user_id]" value="<?= $auth->user_id ?>"/>
    <button class="btn btn-primary" type="submit">Add</button>
</form>

<script type="text/javascript">
    $(document).ready(function(){
        check_places();

        $("#date").change(function(){
            check_places();
        });

        $( "#toggler" ).click(function() {
            $( "#list" ).toggle( "slow", function() {
                // Animation complete.
            });
        });
    });

    function check_places() {
        var kuupaeva_id = $('#date').val();
        $.ajax({
            url: "check_free_places.php",
            context: this,
            data: {kuupaeva_id: kuupaeva_id}
        }).done(function (data) {
            $("#numbercontrol").text("");
            if (data != 26) {
                $("#numbercontrol").text("(Ainult " + data + " vaba kohta)");
            }
        });
    }
</script>