module SiteHelper

    def msg_jumbotron
        case params[:action]
        when 'index'
            "Últimas questões cadastradas..."
        when 'questions'
            "Resultados para \"#{sanitize params[:term]}\"..."
        when 'subject'
            "Mostrando questões do assunto \"#{sanitize params[:subject]}\""
            end
    end
end
