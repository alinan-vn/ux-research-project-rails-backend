class AuthController < ApplicationController
    def create_buyer
        buyer = Buyer.find_by(first_name: params[:first_name])
        if buyer.last_name == params[:last_name]
            if buyer && buyer.authenticate(params[:password_digest])
                payload = { id: buyer.id }
                hmac_secret = 'secret'
                token = JWT.encode(payload, hmac_secret, 'HS256')
                render json: { 
                    buyer: buyer.as_json( except: :password_digest),
                    token: token
                }
            else
                render json: { error: 'invalid login' }
            end
        else
            render json { error: 'params last name and first name dont match' }
        end
    end

    def show_buyer
        token = request.headers['Authorization'].split(' ')[1]
        decoded_token = JWT.decode(token, 'secret', true, { algorithm: 'HS256'})
        buyer_id = decoded_token[0]['id']
        buyer = Buyer.find_by(id: buyer_id)

        if buyer
            render json: { 
                buyer: buyer.as_json( except: :password_digest),
                token: token
            }
        else
            render json: { error: 'invalid token' }
        end
    end

    def create_seller
        seller = Seller.find_by(first_name: params[:first_name])
        if seller.last_name == params[:last_name]
            if seller && seller.authenticate(params[:password_digest])
                payload = { id: seller.id }
                hmac_secret = 'secret'
                token = JWT.encode(payload, hmac_secret, 'HS256')
                render json: { 
                    seller: seller.as_json( except: :password_digest),
                    token: token
                }
            else
                render json: { error: 'invalid login' }
            end
        else
            render json { error: 'params last name and first name dont match' }
        end
    end

    def show_seller
        token = request.headers['Authorization'].split(' ')[1]
        decoded_token = JWT.decode(token, 'secret', true, { algorithm: 'HS256'})
        seller_id = decoded_token[0]['id']
        seller = Seller.find_by(id: seller_id)

        if seller
            render json: { 
                seller: seller.as_json( except: :password_digest),
                token: token
            }
        else
            render json: { error: 'invalid token' }
        end
    end
end