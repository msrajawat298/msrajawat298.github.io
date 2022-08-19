<?php
//Dependency Injection ::
//==============================
class Logger
{
    public function log($message)
    {
        echo "Logging message: Smessage";
    }
}

class UserProfile
{

    private $logger;
    public function createUser()
    {
        $this->logger->log("User Created. ");
    }
    public function updateUser()
    {
        //updtae userSSSS
        $this->logger->log("user updated. ");
    }
    public function deleteUser()
    {
        //delete user.
        $this->logger->log("User deleted . ");
    }
    public function __construct(Logger $logger)
    {
        $this->logger = $logger;
    }
}
$logger  = new Logger();
$profile =  new UserProfile($logger);
$profile->createUser();