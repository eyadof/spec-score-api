require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

module SpecScoreApi
  describe TeammatesController do
    routes { SpecScoreApi::Engine.routes }
    # This should return the minimal set of attributes required to create a valid
    # Teammate. As you add validations to Teammate, be sure to
    # adjust the attributes here as well.
    let(:valid_attributes) do
      FactoryGirl.attributes_for(:teammate).merge(project: @project) 
    end

    before do
      @project = FactoryGirl.create(:project)
    end

    # This should return the minimal set of values that should be in the session
    # in order to pass any filters (e.g. authentication) defined in
    # TeammatesController. Be sure to keep this updated too.
    let(:valid_session) { {} }

    describe "GET index" do
      it "assigns all teammates as @teammates" do
        teammate = Teammate.create! valid_attributes
        get :index, { project_id: @project.to_param }, valid_session
        assigns(:teammates).should eq([teammate])
      end
    end

    describe "GET show" do
      it "assigns the requested teammate as @teammate" do
        teammate = Teammate.create! valid_attributes
        get :show, { project_id: @project.to_param, 
                     id: teammate.to_param }, valid_session
        assigns(:teammate).should eq(teammate)
      end
    end

    describe "GET new" do
      it "assigns a new teammate as @teammate" do
        get :new, { project_id: @project.to_param }, valid_session
        assigns(:teammate).should be_a_new(Teammate)
      end
    end

    describe "GET edit" do
      it "assigns the requested teammate as @teammate" do
        teammate = Teammate.create! valid_attributes
        get :edit, { project_id: @project.to_param, id: teammate.to_param }, valid_session
        assigns(:teammate).should eq(teammate)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Teammate" do
          expect do
            post :create, { project_id: @project.to_param, 
                            teammate: valid_attributes }, valid_session
          end.to change(Teammate, :count).by(1)
        end

        it "assigns a newly created teammate as @teammate" do
          post :create, { project_id: @project.to_param, 
                          teammate: valid_attributes }, valid_session
          assigns(:teammate).should be_a(Teammate)
          assigns(:teammate).should be_persisted
        end

        it "redirects to the created teammate" do
          post :create, { project_id: @project.to_param, 
                          teammate: valid_attributes }, valid_session
          response.should redirect_to(project_teammate_url(@project, Teammate.last))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved teammate as @teammate" do
          # Trigger the behavior that occurs when invalid params are submitted
          Teammate.any_instance.stub(:save).and_return(false)
          post :create, { project_id: @project.to_param, 
                          teammate: { "user_id" => "invalid value" }
                        }, valid_session
          assigns(:teammate).should be_a_new(Teammate)
        end

        it "re-renders the 'new' template" do
          # Trigger the behavior that occurs when invalid params are submitted
          Teammate.any_instance.stub(:save).and_return(false)
          post :create, { project_id: @project.to_param, 
                          teammate: { "user_id" => "invalid value" }
                        }, valid_session
          response.should render_template("new")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested teammate" do
          teammate = Teammate.create! valid_attributes
          # Assuming there are no other teammates in the database, this
          # specifies that the Teammate created on the previous line
          # receives the :update_attributes message with whatever params are
          # submitted in the request.
          Teammate.any_instance.should_receive(:update).with("user_id" => "1")
          put :update,  { project_id: @project.to_param, 
                          id: teammate.to_param, 
                          teammate: { "user_id" => "1" }
                        }, valid_session
        end

        it "assigns the requested teammate as @teammate" do
          teammate = Teammate.create! valid_attributes
          put :update, { project_id: @project.to_param, 
                         id: teammate.to_param, 
                         teammate: valid_attributes }, valid_session
          assigns(:teammate).should eq(teammate)
        end

        it "redirects to the teammate" do
          teammate = Teammate.create! valid_attributes
          put :update, { project_id: @project.to_param, 
                         id: teammate.to_param, 
                         teammate: valid_attributes }, valid_session
          response.should redirect_to(project_teammate_path(@project, teammate))
        end
      end

      describe "with invalid params" do
        it "assigns the teammate as @teammate" do
          teammate = Teammate.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Teammate.any_instance.stub(:save).and_return(false)
          put :update, { project_id: @project.to_param, 
                         id: teammate.to_param, 
                         teammate: { "user_id" => "invalid value" } }, valid_session
          assigns(:teammate).should eq(teammate)
        end

        it "re-renders the 'edit' template" do
          teammate = Teammate.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Teammate.any_instance.stub(:save).and_return(false)
          put :update, { project_id: @project.to_param, 
                         id: teammate.to_param, 
                         teammate: { "user_id" => "invalid value" }
                       }, valid_session
          response.should render_template("edit")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested teammate" do
        teammate = Teammate.create! valid_attributes
        expect do
          delete :destroy, { project_id: @project.to_param,
                             id: teammate.to_param }, valid_session
        end.to change(Teammate, :count).by(-1)
      end

      it "redirects to the teammates list" do
        teammate = Teammate.create! valid_attributes
        delete :destroy, { project_id: @project.to_param, 
                           id: teammate.to_param }, valid_session
        response.should redirect_to(project_teammates_url(@project))
      end
    end

  end
end
