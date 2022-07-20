<?php

include(ROOT_PATH . "/app/database/db.php");
//include(ROOT_PATH . "/app/helpers/middleware.php");
include(ROOT_PATH . "/app/helpers/validateTopic.php");

$table = 'topics';

$errors = array();
$id = '';
$name = '';
$sale = '';

$topics = selectAll($table);


if (isset($_POST['add-topic'])) {
    
    $errors = validateTopic($_POST);
  
        if (!empty($_FILES['image']['name'])) {
           $image_name=time().'_'.$_FILES['image']['name'];
          $destination = ROOT_PATH . "/assets/images/" . $image_name;

        $result = move_uploaded_file($_FILES['image']['tmp_name'], $destination);
        
        if($result){
            $_POST['image']=$image_name;
        }else{
             array_push($errors,"Failed to upload the image" );
        }
    }
        else{
            array_push($errors,"Post image required" );
        }
    if (count($errors) === 0) {
        unset($_POST['add-topic']);
        $topic_id = create($table, $_POST);
        $_SESSION['message'] = 'Topic created successfully';
        $_SESSION['type'] = 'success';
        header('location: ' . BASE_URL . '/admin/topics/index.php');
        exit(); 
    } else {
        $name = $_POST['name'];
        $sale = $_POST['sale'];
    }
}


if (isset($_GET['id'])) {
    $id = $_GET['id'];
    $topic = selectOne($table, ['id' => $id]);
    $id = $topic['id'];
    $name = $topic['name'];
    $sale = $topic['sale'];
}

if (isset($_GET['del_id'])) {
   
    $id = $_GET['del_id'];
    $count = delete($table, $id);
    $_SESSION['message'] = 'Topic deleted successfully';
    $_SESSION['type'] = 'success';
    header('location: ' . BASE_URL . '/admin/topics/index.php');
    exit();
}


if (isset($_POST['update-topic'])) {
    
    $errors = validateTopic($_POST);
 if (!empty($_FILES['image']['name'])) {
           $image_name=time().'_'.$_FILES['image']['name'];
          $destination = ROOT_PATH . "/assets/images/" . $image_name;

        $result = move_uploaded_file($_FILES['image']['tmp_name'], $destination);
        
        if($result){
            $_POST['image']=$image_name;
        }else{
             array_push($errors,"Failed to upload the image" );
        }
    }
        else{
            array_push($errors,"Post image required" );
        }
   
    if (count($errors) === 0) { 
        $id = $_POST['id'];
        unset($_POST['update-topic'], $_POST['id']);
        $topic_id = update($table, $id, $_POST);
        $_SESSION['message'] = 'Topic updated successfully';
        $_SESSION['type'] = 'success';
        header('location: ' . BASE_URL . '/admin/topics/index.php');
        exit();
    } else {
        $id = $_POST['id'];
        $name = $_POST['name'];
        $sale = $_POST['sale'];
    }

}
