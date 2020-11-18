Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8282B7F6B
	for <lists+linux-remoteproc@lfdr.de>; Wed, 18 Nov 2020 15:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgKROaI (ORCPT <rfc822;lists+linux-remoteproc@lfdr.de>);
        Wed, 18 Nov 2020 09:30:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:54850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbgKROaI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 09:30:08 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605709807;
        bh=nBOxISI7ecVa7TTBPigkR/9k9M/rIFYfXkLkQh9H+xE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=aUJxovfQ9d8KMFj+s2uuzSdR+edVjxGffLPD0E0OONy3CwWNJe2xVcmc4OgtwmTcm
         ShLkXjKGjfx1oyN3vbXRXjVI9c2DdxHlP5etIGJFSIBUrQhXXqpsueNzt4aJqjc7em
         3yeVZamB4L22rqi1KhGXq9DEYjKHfaANSVu2zSRY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom: fix reference leak in adsp_start
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160570980701.9988.1584176934804447500.git-patchwork-notify@kernel.org>
Date:   Wed, 18 Nov 2020 14:30:07 +0000
References: <20201102143534.144484-1-zhangqilong3@huawei.com>
In-Reply-To: <20201102143534.144484-1-zhangqilong3@huawei.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon, 2 Nov 2020 22:35:34 +0800 you wrote:
> pm_runtime_get_sync will increment pm usage counter even it
> failed. Forgetting to pm_runtime_put_noidle will result in
> reference leak in adsp_start, so we should fix it.
> 
> Fixes: dc160e4491222 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> 
> [...]

Here is the summary with links:
  - remoteproc: qcom: fix reference leak in adsp_start
    https://git.kernel.org/andersson/remoteproc/c/00293e662cca

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


