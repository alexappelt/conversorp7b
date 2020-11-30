class ConversorController < ApplicationController



    def index
    puts "teste"
    end



    def gerar
        
        fork {exec "ls"}
        
        fork {exec "rm -rf public/certificados/#{params[:estado]}.crt"}

        if Arquivo.where(" nome == '#{params[:estado]}.crt' " ).count >= 1
            Arquivo.where(" nome == '#{params[:estado]}.crt' " ).delete_all
        end

       
       
        if params[:file][:cert].present?
            puts "criando novo"
            File.open(Rails.root.join('public', 'certificados', "#{params[:estado]}.p7b"), 'wb') do |file|
             file.write(params[:file][:cert].read)
            end
        
          end

   
        
         
          arquivo = Arquivo.new
          arquivo.nome = "#{params[:estado]}.crt"
          arquivo.save!

         
          fork {exec "openssl pkcs7 --print_certs --in public/certificados/#{params[:estado]}.p7b --inform der --outform pem --out public/certificados/#{params[:estado]}.crt"}
        
    end




end