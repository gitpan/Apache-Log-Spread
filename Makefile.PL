package Apache::Log::Spread;

use ExtUtils::MakeMaker;

use Apache::ExtUtils qw( command_table );
use Apache::src ();

my @directives = (
        {       name             => 'MLS_LogFormat',
                errmsg           => 'A format string and a identifier',
                args_how         => 'TAKE2',
                req_override => 'RSRC_CONF'
        },
        {
                name             => 'MLS_Log',
                errmsg           => 'file|pipe|spread format [env]',
                args_how         => 'TAKE23',
                req_override => 'RSRC_CONF'
        },
        {
                name             => 'SpreadDaemon',
                errmsg           => 'port[@host]',
                args_how         => 'TAKE1',
                req_override => 'RSRC_CONF'
        }, );
          
command_table(\@directives);

WriteMakefile(
    'NAME'		=> 'Apache::Log::Spread',
    'VERSION_FROM'	=> 'Spread.pm', 
    'PREREQ_PM'		=> {Spread => 0, 'Apache::Util' => 0, 'Apache::ModuleConfig' => 0, 'Apache::Constants' => 0, 'DynaLoader' => 0,},
    'INC'   => Apache::src->new->inc,     
);
__END__
