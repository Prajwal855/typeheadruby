class UsersApiController < ApplicationController
    def index
        users = UserApi.all
        if users.empty?
            render json:{
                message: "Users Not Found ",
                users: []
            },status: :not_found
        else
            render json:{
                message: "Users Found",
                users: users
            },stauts: :ok
        end
    end

    def show
        user = set_user
        if user
            render json:{
                message: "User Found",
                user: user
            },status: :ok
        else
            render json:{
                message: "User Not Found"
            },status: :not_found
        end
    end

    def typehead
        search = params[:search].to_s
        users = UserApi.where("email like ? OR first_name like ? OR last_name like ?","%#{search}%","%#{search}%","%#{search}%")
        if users.empty?
            render json:{
                message: "No User Found With the Search name #{params[:search]}",
                users:[]
        },status: :not_found
        else
            render json:{
                message: "Users Found",
                users:users
            },status: :ok
        end
    end

    def create
        user = UserApi.create(user_params)
        if user.save
            render json:{
                message: "User Created Successfully",
                user: user
            },status: :created
        else
            render json: {
                message: "User Cannot be Created",
                error: user.errors.full_messages
            },status: :unproccessable_entity
        end
    end

    def update
        user = set_user
        if user.update(user_params)
            render json:{
                message: "User Updated Successfully",
                user: user
            },status: :ok
        else
            render json:{
                message: "User Cannot Be Updated",
                error: user.errors.full_messages
            },status: :unproccessable_entity
        end
    end

    def destroy
        user = set_user
        if user.delete
            render json:{
                message: "User Deleted Successfully"
            },status: :ok
        else
            render json:{
                message: "User Cannot Be Deleted",
                error: user.errors.full_messages
            },stauts: :unproccessable_entity
        end
    end

    private 
    def user_params
        params.require(:user).permit(:first_name,:last_name,:email)
    end

    def set_user
        user = UserApi.find_by(id: params[:id])
        if user
            return user 
        end
    end
end
