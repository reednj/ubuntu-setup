
task :chruby do
    unless File.exist? "/usr/local/share/chruby/chruby.sh" 
        name = "chruby-0.3.9"
        sh "wget -O #{name}.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz"
        sh "tar -xzvf #{name}.tar.gz"
        
        Dir.chdir("#{name}") do 
            sh "sudo make install"
        end

        sh "rf -rf #{name}"
        sh "rf -rf #{name}.tar.gz"
    end
end

task :add_ruby_install do 
    unless File.exist? "/usr/local/bin/ruby-install"
        name = "ruby-install-0.6.1"
        sh "wget -O #{name}.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.1.tar.gz"
        sh "tar -xzvf #{name}.tar.gz"
        
        Dir.chdir("#{name}") do 
            sh "sudo make install"
        end

        sh "rf -rf #{name}"
        sh "rf -rf #{name}.tar.gz"
    end
end

task :chruby_bash_install => :chruby do
    bashrc = "#{ENV['HOME']}/.bashrc"
    unless File.include?(bashrc, "chruby.sh")
        File.append(bashrc, "\nsource /usr/local/share/chruby/chruby.sh\n")
    end
end

task :install_ruby_version => :add_ruby_install do
    v = "2.2.6"
    sh "ruby-install"
    sh "ruby-install ruby #{v}"
end

task :install_nginx do
    unless File.exist? "/etc/nginx/passenger.conf"
        sh "chmod 755 install.nginx.sh"
        sh "./install.nginx.sh"
    end
end

class File
	def self.append(path, data)
		File.open(path, 'a:UTF-8') do |file| 
			file.write data 
		end
	end

    def self.include?(path, pattern)
        File.read(path).include? pattern
    end
end
