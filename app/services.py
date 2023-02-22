import os 

class Services:


    def env_var_list():
        return os.popen('env').read()



    def create_env_vars(env_var_name, env_var_content):
        var = os.environ[str(env_var_name)] = str(env_var_content)

        os.popen('export ' + var)

        return var



    def list_running_software():
        return os.popen('ps aux').read()