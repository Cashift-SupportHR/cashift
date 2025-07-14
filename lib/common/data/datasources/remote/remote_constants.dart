import 'package:shiftapp/config.dart';

const kApiUrl="${kServerUrl}api/";
const kTestApiUrl="${kTESTServerUrl}api/";
const  kCashiftAPIURL = '${kCashiftURL}api/';

const  kCashiftURL = 'https://cashift.com.sa/';
const kServerUrl="http://support-grp.com:8001/" ;
const kTESTServerUrl="http://85.184.232.39:8080/" ;

const kBASE_URL =Config.isTestVersion ? kTestApiUrl : kCashiftAPIURL;
const kSERVER_URL =Config.isTestVersion ? kTESTServerUrl : kServerUrl;

const SuccessStatus ="success" ;