xml.instruct! :xml, :version => "1.0"
xml.form_template render :inline => "<% form_for(@person) {|f|%><%= render :partial => 'form', :locals => { :form => f } %><%= f.submit t('submit') %><%}%>"