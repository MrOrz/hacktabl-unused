# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  watch("index.html")
  watch(%r{public/.+/.+\.(css|js|html)})
end

# Add files and commands to this file, like the example:
# watch(/(.*).txt/) {|m| `tail #{m[0]}` }
#
guard :shell do

  # Livescript compiler
  watch(%r{app/livescript/(.+)\.ls}) do |m|
    puts "Compiling #{m[0]}"
    `lsc -c -o public/javascripts/ #{m[0]}`
  end
end

# Guard::Compass
#
# You don't need to configure watchers for guard 'compass' declaration as they generated
# from your Compass configuration file. You might need to define the Compass working directory
# and point to the configuration file depending of your project structure.
#
# Available options:
#
# * working_directory: Define the Compass working directory, relative to the Guardfile directory
# * configuration_file: Path to the Compass configuration file, relative to :project_path
#
# Like usual, the Compass configuration path are relative to the :project_path

# guard 'compass', project_path: 'not_current_dir', configuration_file: 'path/to/my/compass_config.rb'
guard :compass, configuration_file: "config/compass.rb"

# Index page
guard "slim", input: "./", output: "./" do
  watch("index.slim")
end

# Angular templates
guard "slim", input: "app/slim", output: "public/templates" do
  watch(%r{app/slim/(.+)\.slim})
end
