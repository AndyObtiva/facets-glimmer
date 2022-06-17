if Object.constants.include?(:Motion)
  Motion::Project::App.setup do |app|
    excluded_core_files = [
      'core/facets/range/nudge.rb',
      'core/facets/applique/file_helpers.rb',
      'core/facets/enumerable/recursively.rb',
      'core/facets/hash/recursively.rb',
      'core/facets/functor.rb',
      'core/facets/lazy.rb',
      'core/facets/enumerable/associate.rb',
      'core/facets/kernel/as.rb',
      'core/facets/kernel/ergo.rb',
    ]
    excluded_standard_files = [
      'standard/facets/uri/query.rb',
      'standard/facets/date.rb',
      'standard/facets/memoizer.rb',
      'standard/facets/enumargs.rb',
      'standard/facets/erb.rb',
      'standard/facets/fileutils/outofdate.rb',
      'standard/facets/interval.rb',
      'standard/facets/pathname/op_div.rb',
      'standard/facets/pathname/exists.rb',
    ]
    app.files += Dir[File.join(__dir__, 'facets-glimmer', 'ext', 'kernel.rb')]
    app.files += Dir[File.join(__dir__, 'core', '**' , '*.rb')].reject do |f|
      excluded_core_files.any? { |excluded_file| f.include?(excluded_file) }
    end
    app.files += Dir[File.join(__dir__, 'standard', '**' , '*.rb')].reject do |f|
      excluded_standard_files.any? { |excluded_file| f.include?(excluded_file) }
    end
  end
end
