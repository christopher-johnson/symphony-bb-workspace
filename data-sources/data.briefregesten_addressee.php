<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcebriefregesten_addressee extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'briefregesten-addressee';
    public $dsParamURL = 'http://localhost:8088/rest/db/apps/blumenbach/data/addressee.xql';
    public $dsParamFORMAT = 'xml';
    public $dsParamXPATH = '/*';
    public $dsParamCACHE = 5;
    public $dsParamTIMEOUT = 6;

    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Briefregesten Addressee',
            'author' => array(
                'name' => 'Christopher Johnson',
                'website' => 'http://localhost',
                'email' => 'christopher.johnson@wikimedia.de'),
            'version' => 'Symphony 2.5.2',
            'release-date' => '2014-12-14T14:23:54+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}