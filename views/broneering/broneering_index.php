<h3>Broneeringud</h3>
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


<?php if ($auth->is_admin): ?>
<h3>Add new user</h3>

<form method="post" id="form">
    <form id="form" method="post">
        <table class="table table-bordered">
            <tr>
                <th>Username</th>
                <td><input type="text" name="data[username]" placeholder="Jaan"/></td>
            </tr>
            <tr>
                <th>Password</th>
                <td><input type="text" name="data[password]" placeholder="******"/></td>
            </tr>
            <tr>
                <th>Active</th>
                <td><input type="checkbox"
                           name="data[active]" checked="checked"/>
            </tr>
            <tr>
                <th>Email</th>
                <td><input type="text" name="data[email]" placeholder="em@ail.ee">
            </tr>
        </table>

        <button class="btn btn-primary" type="submit">Add</button>
    </form>
    <?php endif; ?>
