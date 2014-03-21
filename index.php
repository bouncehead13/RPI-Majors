<?php
    try {
        include('connect.php');
    } catch (Exception $e) {
        $err = "Error: " . $e->getMessage();
    }
    
    $major = $_GET["major"];

    $return = $dbconn->prepare("SELECT * FROM major_information WHERE major_name = '$major'");
    $return->execute();
    $results = $return->fetch(PDO::FETCH_ASSOC);
    $id = $results['major_id'];
    

    $faq = $dbconn->prepare("SELECT * FROM faqs WHERE major_id = $id");
    $faq->execute();
    $v_faq = $faq->fetchAll(PDO::FETCH_ASSOC);
    $questions = array();
    $answers = array();
    foreach($v_faq as $j)
    {
        array_push($questions, $j['question']);
        array_push($answers, $j['answer']);
    }


    $contact = $dbconn->prepare("SELECT * FROM contacts WHERE major_id = $id");
    $contact->execute();
    $v_contact = $contact->fetchAll(PDO::FETCH_ASSOC);
    $names = array();
    $emails = array();
    foreach($v_contact as $j)
    {
        array_push($names, $j['contact_name']);
        array_push($emails, $j['contact_email']);
    }


    $courses = $dbconn->prepare("SELECT * FROM courses WHERE major_id = $id");
    $courses->execute();
    $v_courses = $courses->fetchAll(PDO::FETCH_ASSOC);
    $course_names = array();
    foreach($v_courses as $j)
    {
        array_push($course_names, $j['course']);
    }


    $results['faqs'] = array("questions" => $questions, "answers" => $answers);
    $results['contacts'] = array("names" => $names, "emails" => $emails);
    $results['courses'] = array("courses" => $course_names);
    echo json_encode($results);
?>