Given('que acesse a home') do
    @google_home = GoogleHome.new
    @google_home.load
end
  
Then('deverá exibir o logo da Google') do
    expect(@google_home).to have_css '.lnXdpd'
end

When('buscar por {string}') do |termo|
    @google_home.search_for(termo)
    @google_results = GoogleResults.new
end
  
Then('deverão ser encontrados resultados') do
    expect(@google_results).to have_content 'Jeep Compass'
end
