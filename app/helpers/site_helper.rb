module SiteHelper

    def msg_jumbotron
        case params[:action]
        when 'index'
            "Últimas questões cadastradas..."
        when 'questions'
            "Resultados para \"#{params[:term]}\"..."
        when 'subject'
            "Mostrando questões do assunto \"#{params[:subject]}\""
            end
    end
end
