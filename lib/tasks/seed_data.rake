namespace :seed do
  desc "Seed sample data"
  task :data => :environment do
    development_cost_type = CostType.create({
      name: "Development"
    })

    designing_cost_type = CostType.create({
      name: "Designing"
    })

    marketing_cost_type = CostType.create({
      name: "Marketing"
    })

    # Development costs
    web_dev_cost_type = CostType.create({
      name: "Website Development",
      parent_id: development_cost_type.id
    })
    mobile_app_cost_type = CostType.create({
      name: "Mobile App Development",
      parent_id: development_cost_type.id
    })
    devops_cost_type = CostType.create({
      name: "DevOps",
      parent_id: development_cost_type.id
    })

    # Designing costs
    CostType.create({
      name: "Wireframing",
      parent_id: designing_cost_type.id
    })
    CostType.create({
      name: "UI Design",
      parent_id: designing_cost_type.id
    })
    CostType.create({
      name: "Brochure Design",
      parent_id: designing_cost_type.id
    })

    # Marketing costs
    CostType.create({
      name: "Social Media Marketing",
      parent_id: marketing_cost_type.id
    })
    CostType.create({
      name: "Print Media Marketing",
      parent_id: marketing_cost_type.id
    })

    # Website Development costs
    CostType.create({
      name: "Payment Gateway License",
      parent_id: web_dev_cost_type.id
    })
    CostType.create({
      name: "JavaScript Plugin License",
      parent_id: web_dev_cost_type.id
    })

    # Mobile App Development costs
    CostType.create({
      name: "Google Play Store Fees",
      parent_id: mobile_app_cost_type.id
    })
    CostType.create({
      name: "Apple App Store Fees",
      parent_id: mobile_app_cost_type.id
    })

    # DevOps costs
    CostType.create({
      name: "Servers",
      parent_id: devops_cost_type.id
    })
    CostType.create({
      name: "Domain Name",
      parent_id: devops_cost_type.id
    })
    CostType.create({
      name: "SSL Certificate",
      parent_id: devops_cost_type.id
    })

    client_names = [
      "Avengers",
      "Defenders",
      "Guardians of the Galaxy"
    ]

    projects_count = 0

    client_names.each do |client_name|
      client = Client.create({
        name: client_name,
      })

      # Create 2 projects for each client
      2.times do
        projects_count += 1
        Project.create({
          client: client,
          title: "Project #{projects_count}"
        })
      end
    end

    # Populate costs with random number for all projects
    Project.all.each do |project|
      CostType.all.each do |cost_type|
        Cost.create({
          amount: rand(8000...400000),
          cost_type_id: cost_type.id,
          project: project
        })
      end
    end
  end
end
