﻿using LessonMonitor.Core;
using System;

namespace LessonMonitor.DataAccess
{
    public class UsersRepository : IUsersRepository
    {
        public UsersRepository()
        {

        }

        public Core.User[] Get()
        {
            var user = new User()
            {
                Id = 1,
                Age = 54,
                Name = "Вася"
            };

            return new[] {
                new Core.User
                {
                    Name = user.Name,
                    Age = user.Age
                }
            };
        }

        public void Create(Core.User user)
        {

        }
    }
}
