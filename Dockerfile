# Use base image with Ruby installed
FROM ruby:2.3

# Install packeges
RUN apt-get update -qq && apt-get install -y build-essential

# Copy raddit gemfiles and install gems
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY raddit/Gemfile* $APP_HOME/
RUN bundle install

# Copy the application code to the container
ADD raddit/ $APP_HOME

# Run reddit
CMD ["puma"]
