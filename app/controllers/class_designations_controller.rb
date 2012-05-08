class ClassDesignationsController < ApplicationController
  before_filter :login_required
  filter_access_to :all

  def index
    @class_designations = ClassDesignation.all
    @class_designation = ClassDesignation.new
  end

  def create_class_designation
    @class_designation = ClassDesignation.new(params[:class_designation])
    if @class_designation.save
      @class_designation = ClassDesignation.new
      @class_designations = ClassDesignation.all
      render(:update) do|page|
        page.replace_html "category-list", :partial=>"class_designations"
        page.replace_html 'flash', :text=>'<p class="flash-msg"> Class Designation created successfully. </p>'
        page.replace_html 'errors', :partial=>"form_errors"
        page.replace_html 'class_form', :partial=>"class_form"
      end
    else
      render(:update) do|page|
        page.replace_html 'errors', :partial=>'form_errors'
        page.replace_html 'flash', :text=>""
      end
    end
  end

  def edit_class_designation
    @class_designation = ClassDesignation.find(params[:id])
    render(:update) do|page|
      page.replace_html "class_form", :partial=>"class_edit_form"
      page.replace_html 'errors', :partial=>'form_errors'
      page.replace_html 'flash', :text=>""
    end
  end

  def update_class_designation
    @class_designation = ClassDesignation.find(params[:id])
    if @class_designation.update_attributes(params[:class_designation])
      @class_designation = ClassDesignation.new
      @class_designations = ClassDesignation.all
      render(:update) do|page|
        page.replace_html "category-list", :partial=>"class_designations"
        page.replace_html 'flash', :text=>'<p class="flash-msg"> Class Designation updated successfully. </p>'
        page.replace_html 'errors', :partial=>"form_errors"
        page.replace_html 'class_form', :partial=>"class_form"
      end
    else
      render(:update) do|page|
        page.replace_html 'errors', :partial=>'form_errors'
        page.replace_html 'flash', :text=>""
      end
    end
  end

  def delete_class_designation
    @class_designation = ClassDesignation.find(params[:id])
    @class_designation.destroy
    @class_designation = ClassDesignation.new
    @class_designations = ClassDesignation.all
    render(:update) do|page|
      page.replace_html "category-list", :partial=>"class_designations"
      page.replace_html 'flash', :text=>'<p class="flash-msg"> Class Designation deleted successfully. </p>'
      page.replace_html 'errors', :partial=>"form_errors"
      page.replace_html 'class_form', :partial=>"class_form"
    end
    
  end

end