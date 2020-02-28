Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6ADA173FB0
	for <lists+linux-remoteproc@lfdr.de>; Fri, 28 Feb 2020 19:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgB1SeN (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Fri, 28 Feb 2020 13:34:13 -0500
Received: from mail-yw1-f65.google.com ([209.85.161.65]:42405 "EHLO
        mail-yw1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726917AbgB1SeL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 Feb 2020 13:34:11 -0500
Received: by mail-yw1-f65.google.com with SMTP id n127so4212457ywd.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Feb 2020 10:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BK15KB/QIM0mjkXnJvo5g++rrPQHZRXMLS7sBMicyC8=;
        b=i5m6xuAZe5RRVpl8q9MO9a3KL+ZcW7ieF+qHvb+qiofbgjGxKsIAIhKO9J1qRBU/9Z
         MgdsVOTzz3+Zz7gbctueJQ+AiBNy9C/nwtl38qoAsOGC/kVNWBeA4F7bgiEQB5dQhBh7
         dFVSv7wA87+fgSnyffkTnLWbIO6yNNtxooNFuXEZ6GsV0BzxkuCLFQdHQ8RKtEKdjUDm
         Q2ShYNUkYBX0C03w0l6U+SRJyl/8HKoHY9xrx6osoRQ4IN2qVXqau+027IhIpXREsnhN
         S/yqZ1k71m5JrbvvAlwowi2PVSfo5moQCk2jy60a90Fr7L3p2XaNIFAKRhq43x3dhGH0
         Vh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BK15KB/QIM0mjkXnJvo5g++rrPQHZRXMLS7sBMicyC8=;
        b=AJ/XwRQeWRCAa+U7VmE7kqkzKu/QrZ1D6FuAwtqaX+xFZBCmx1bv8ua/EiqzgzGCj7
         A8spzh10QlRKt4SM+b27CB0UzrZ0W3JIs/48JmnYuMslI++CDSu1kqCklQYeyYDYeTIB
         PNVuE53PSGwkjKp/9o6322ZEykAMRBT38aQJafqkoismtWUVlYI/s4fLPt97UxXyAq8B
         ipVpfSjhlulfwuqW3jnM5JU8baiUdXffaORGLuXhmrj3yktBwnVsMR9Gw6tTEIpybjA9
         9OkAQLlUzFRd6A32XkKo8mN6IoLcrZSLT6PEf7ZKuyNxskbqYfyCjn4eASMfB0IGg+JI
         ntTQ==
X-Gm-Message-State: APjAAAXznfB1AASYgdWzBSQqj57PsAMVEbx9GlczQ0SFHG6292z3eaLx
        LmHSG3Lc7mS9oLx1DLF6l0mVrA==
X-Google-Smtp-Source: APXvYqw8fkpj6XswFJXpxuziB4EMenzmu1+75H7yEeTGC+Rq3p8Us+0TZgQDiD0ZE31ertH7yvc0eg==
X-Received: by 2002:a81:2f09:: with SMTP id v9mr5597838ywv.478.1582914847575;
        Fri, 28 Feb 2020 10:34:07 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id o127sm4409884ywf.43.2020.02.28.10.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 10:34:07 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] remoteproc: return error for bad "recovery" debugfs input
Date:   Fri, 28 Feb 2020 12:33:59 -0600
Message-Id: <20200228183359.16229-5-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228183359.16229-1-elder@linaro.org>
References: <20200228183359.16229-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

If the value written to the "recovery" debugfs file is not one of
the recognized commands return an error to indicate it's invalid.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/remoteproc_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index e995dc49c231..0d478bfefd9c 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -146,6 +146,8 @@ rproc_recovery_write(struct file *filp, const char __user *user_buf,
 	} else if (!strncmp(buf, "recover", count)) {
 		/* begin the recovery process without changing the flag */
 		rproc_trigger_recovery(rproc);
+	} else {
+		return -EINVAL;
 	}
 
 	return count;
-- 
2.20.1

