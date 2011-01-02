package br.com.stimuli.loading.utils 
{
    public class SmartURL extends Object
    {
        public function SmartURL(arg1:String)
        {
            var loc3:*=null;
            var loc4:*=null;
            var loc5:*=null;
            super();
            this.rawString = arg1;
            var loc1:*=new RegExp("((?P<protocol>[a-zA-Z]+: \\/\\/)   (?P<host>[^:\\/]*) (:(?P<port>\\d+))?)?  (?P<path>[^?]*)? ((?P<query>.*))? ", "x");
            var loc2:*=loc1.exec(arg1);
            if (loc2) 
            {
                this.protocol = Boolean(loc2.protocol) ? loc2.protocol : "http://";
                this.protocol = this.protocol.substr(0, this.protocol.indexOf("://"));
                this.host = loc2.host || null;
                this.port = loc2.port ? int(loc2.port) : 80;
                this.path = loc2.path;
                this.queryString = loc2.query;
                if (this.queryString) 
                {
                    this.queryObject = {};
                    this.queryString = this.queryString.substr(1);
                    var loc6:*=0;
                    var loc7:*=this.queryString.split("&");
                    for each (loc5 in loc7) 
                    {
                        loc4 = loc5.split("=")[0];
                        loc3 = loc5.split("=")[1];
                        this.queryObject[loc4] = loc3;
                        var loc8:*;
                        var loc9:*=((loc8 = this).queryLength + 1);
                        loc8.queryLength = loc9;
                    }
                }
            }
            else 
            {
                trace("no match");
            }
            return;
        }

        public function toString(... rest):String
        {
            if (rest.length > 0 && rest[0] == true) 
            {
                return "[URL] rawString :" + this.rawString + ", protocol: " + this.protocol + ", port: " + this.port + ", host: " + this.host + ", path: " + this.path + ". queryLength: " + this.queryLength;
            }
            return this.rawString;
        }

        public var rawString:String;

        public var port:int;

        public var path:String;

        public var queryObject:Object;

        public var queryString:String;

        public var host:String;

        public var queryLength:int=0;

        public var protocol:String;
    }
}
