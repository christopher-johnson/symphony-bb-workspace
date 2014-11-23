<?php

require_once(EXTENSIONS . '/remote_datasource/data-sources/datasource.remote.php');

class datasourcelistwork extends RemoteDatasource {

    public $dsParamROOTELEMENT = 'listwork';
    public $dsParamURL = 'http://localhost:8088/rest/db/apps/blumenbach/data/list.xml';
    public $dsParamFORMAT = 'xml';
    public $dsParamXPATH = '/*';
    public $dsParamCACHE = 5;
    public $dsParamTIMEOUT = 6;

    public $dsParamNAMESPACES = array(
			'collection' => 'http://www.w3.org/2001/XInclude',
		);

    public function __construct($env=NULL, $process_params=true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'ListWork',
            'author' => array(
                'name' => 'Christopher Johnson',
                'website' => 'http://localhost',
                'email' => 'christopher.johnson@wikimedia.de'),
            'version' => 'Symphony 2.5.2',
            'release-date' => '2014-11-22T23:28:57+00:00'
        );
    }

    public function allowEditorToParse()
    {
        return true;
    }

}