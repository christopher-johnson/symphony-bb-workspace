<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcebriefregesten1_1 extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'briefregesten1-1';
    public $dsParamURL = 'http://localhost:8088/rest/db/apps/blumenbach/data/br/BR_1.1.3.xml';
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
            'name' => 'Briefregesten1.1',
            'author' => array(
                'name' => 'Christopher Johnson',
                'website' => 'http://localhost',
                'email' => 'christopher.johnson@wikimedia.de'),
            'version' => 'Symphony 2.5.2',
            'release-date' => '2015-01-25T11:04:39+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}