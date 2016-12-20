class LookingForService
  def self.recent_jobs
    result = Faraday.get('http://lookingforme.herokuapp.com/api/v1/recent_jobs')
    raw_jobs = JSON.parse(result.body)['recent_jobs']
    raw_jobs.map do |raw_job|
      Job.new(raw_job)
    end
  end
end
