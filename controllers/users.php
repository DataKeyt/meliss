<?php namespace Halo;

/**
 * Created by PhpStorm.
 * User: Maile
 * Date: 17.09.14
 * Time: 18:19
 */
class users extends Controller
{
    public $requires_auth = true;

    function index()
    {
        $this->users = get_all("SELECT * FROM users WHERE deleted=0");

    }

    function view()
    {
        $user_id = $this->params[0];
        if (empty($user_id))
            error_out('Check user ID in address bar');
        $this->user = get_first("SELECT * FROM users WHERE user_id = '$user_id'");

    }

    function post_index()
    {
        $data = $_POST['data'];

        $data['active'] = isset($data['active']) ? 1 : 0;
        $user_id = insert('users', $data);
        header('Location: ' . BASE_URL . 'users/view/' . $user_id);
    }

    function edit_post()
    {
        $data = $_POST['data'];
        insert('users', $data);
        header('Location: ' . BASE_URL . 'users/view/' . $this->params[0]);
    }

    function post_delete()
    {
        $user_id = $_POST['user_id'];
        update('users', ['deleted' => '1'], "user_id = '$user_id'");
        exit("1");
    }

    function edit()
    {
        $user_id = $this->params[0];
        $this->user = get_first("SELECT * FROM users WHERE user_id = '$user_id'");
    }

} 