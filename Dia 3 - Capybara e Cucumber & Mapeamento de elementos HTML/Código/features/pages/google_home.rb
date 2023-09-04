class GoogleHome < BasePage

    def search_for(query)
        find("textarea[name='q']").set query
        find(".UUbT9 .gNO89b").click
    end
end
