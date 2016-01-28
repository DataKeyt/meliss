<?php namespace Halo;

class broneering extends Controller
{
    public $requires_auth = true;

    protected $joins ='broneering JOIN kellaeg USING (kellaja_id) JOIN kuupaev USING (kuupaeva_id) JOIN users USING (user_id)';

    function index()
    {
        $days = get_all("SELECT kuupaev FROM kuupaev");
        foreach ($days as $day) {
            $this->broneerings[$day['kuupaev']] = get_all("SELECT * FROM $this->joins WHERE kuupaev = '{$day['kuupaev']}'");
        }
    }

    function view()
    {
        $broneering_id = $this->params[0];
        $this->broneering = get_first("SELECT * FROM $this->joins WHERE broneering_id = '{$broneering_id}'");
    }

    function edit()
    {
        $broneering_id = $this->params[0];
        $this->broneering = get_first("SELECT * FROM broneering WHERE broneering_id = '{$broneering_id}'");
    }

    function post_edit()
    {
        $data = $_POST['data'];
        insert('broneering', $data);
        header('Location: ' . BASE_URL . 'broneering/view/' . $this->params[0]);
    }

    function ajax_delete()
    {
        exit(q("DELETE FROM broneering WHERE broneering_id = '{$_POST['broneering_id']}'") ? 'Ok' : 'Fail');
    }

}