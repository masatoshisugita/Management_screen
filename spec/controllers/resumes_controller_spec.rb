require 'rails_helper'

RSpec.describe ResumesController, type: :controller do
  describe "#index" do
    it "正常にレスポンスを返すこと" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#create" do
    context "有効な属性値の場合" do
      it "resumeを追加できること" do
        resume = Resume.new
        resume_params = FactoryBot.attributes_for(:resume)
        expect{post :create, params: {resume: resume_params}}.to change{Resume.count}.by(1)
      end
    end

    context "無効な属性値の場合" do
      it "resumeを追加できないこと" do
        resume = Resume.new
        resume_params = FactoryBot.attributes_for(:resume,:invalid)
        expect{post :create, params: {resume: resume_params}}.not_to change{Resume.count}
      end
    end
  end

  describe "#show" do
    it "200レスポンスを返すこと" do
      resume = FactoryBot.create(:resume)
      get :show,params: {id: resume.id}
      expect(response).to have_http_status "200"
    end
  end

  describe "#update" do
    before do
      @resume = FactoryBot.create(:resume)
    end
      context "有効な属性値の場合" do
        it "resumeを追加できること" do
          resume_params = FactoryBot.attributes_for(:resume,name: "New Resume")
          patch :update, params: {id: @resume.id, resume: resume_params}
          expect(@resume.reload.name).to eq "New Resume"
        end
      end

      context "無効な属性値の場合" do
        it "resumeを追加できないこと" do
          resume_params = FactoryBot.attributes_for(:resume,name: nil)
          patch :update, params: {id: @resume.id, resume: resume_params}
          expect(@resume.reload.name).to eq "Test Name"
        end

        it "編集画面に戻ること"do
          resume_params = FactoryBot.attributes_for(:resume,name: nil)
          patch :update, params: {id: @resume.id,resume: resume_params}
          expect(response).to render_template(:edit)
        end
      end
  end

  describe "#destroy" do
    it "resumeを削除できること" do
      resume = FactoryBot.create(:resume)
      expect {delete :destroy, params: { id: resume.id }}.to change{Resume.count}.by(-1)
    end
  end

  describe "#new" do
    it "200レスポンスを返すこと" do
      get :new
      expect(response).to have_http_status "200"
    end

    it "newテンプレートが表示されていること" do
      get :new
      expect(response).to render_template(:new)
    end

    it '@resumeがnewされていること' do
      get :new
      expect(assigns :resume).to_not be_nil
    end
  end

  describe "#edit" do
    before do
      @resume = FactoryBot.create(:resume)
    end

    it "200レスポンスを返すこと" do
      get :edit, params: {id: @resume.id}
      expect(response).to have_http_status "200"
    end

    it "editテンプレートが表示されていること" do
      get :edit, params: {id: @resume.id}
      expect(response).to render_template(:edit)
    end

    it "@resumeが取得できていること" do
      get :edit, params: {id: @resume.id}
      expect(assigns :resume).to eq @resume
    end
  end
  
end
