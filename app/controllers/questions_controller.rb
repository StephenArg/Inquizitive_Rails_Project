class QuestionsController < ApplicationController
    def index
        # @subjects = Question.all.map do |q|
        #     q.subject
        # end.uniq
    end

    def new
        @question = Question.new
    end

    def create
        @question = Question.new(new_question_params)
        if @question.save
            redirect_to subjects_question_path
        else
            render :new
        end
    end

    def show
        @question = Question.find(params[:id])
        if session[:current_user_id]
            @user = User.find(session[:current_user_id])
        end
    end

    def result
        @question = Question.find(params[:id])
        if params[:question][:answer] == @question.answer
            # flash[:message] = "CORRECT"
            @correct = 1
        else
            # flash[:message] = "Wrong Answer."
            @correct = params[:question][:answer]
        end
        render :result
    end

    def subjects
        @subjects = Question.all.map do |q|
            q.subject
        end.uniq
    end

    def topics
        subject = question_params
        @subject = subject[:subject]
        questions = Question.all.select do |q|
                q.subject == @subject
        end
        @topics = questions.map do |q|
            q.topic
        end.uniq
    end

    def questions
        parameters = question_params
        @topic = parameters[:topic]
        @subject = parameters[:subject]
        @questions = Question.all.select do |q|
            q.subject == @subject && q.topic == @topic
        end
    end

    def delete_question
        question = Question.find(params[:question_id])
        question.destroy
        redirect_to subjects_question_path
    end

    private

    def question_params
        params.permit(:topic, :subject)
    end

    def answer_params
        params.require(:question).permit(:answer)
    end

    def new_question_params
        params.require(:question).permit(:question, :answer, :subject, :topic, :image_url)
    end

end
