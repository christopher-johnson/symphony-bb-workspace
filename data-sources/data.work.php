<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcework extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'work';
    public $dsParamURL = 'http://localhost:8088/rest/db/apps/blumenbach/data/{$work}';
    public $dsParamFORMAT = 'xml';
    public $dsParamXPATH = '/TEI:TEI/TEI:teiHeader';
    public $dsParamCACHE = 5;
    public $dsParamTIMEOUT = 6;

    public $dsParamNAMESPACES = array(
			'TEI' => 'http://www.tei-c.org/ns/1.0',
		);

    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Work',
            'author' => array(
                'name' => 'Christopher Johnson',
                'website' => 'http://localhost',
                'email' => 'christopher.johnson@wikimedia.de'),
            'version' => 'Symphony 2.5.2',
            'release-date' => '2014-11-22T15:14:53+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}